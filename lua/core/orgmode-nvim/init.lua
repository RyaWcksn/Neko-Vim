-- init.lua

-- Load custom tree-sitter grammar for org filetype
require("orgmode").setup_ts_grammar()

-- Tree-sitter configuration
require("nvim-treesitter.configs").setup({
	-- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
	highlight = {
		enable = true,
		disable = { "org" }, -- Remove this to use TS highlighter for some of the highlights (Experimental)
		additional_vim_regex_highlighting = { "org" }, -- Required since TS highlighter doesn't support all syntax features (conceal)
	},
	ensure_installed = { "org" }, -- Or run :TSUpdate org
})

require("orgmode").setup({
	org_agenda_files = { "~/Dropbox/org/*", "~/my-orgs/**/*" },
	org_default_notes_file = "~/Dropbox/org/refile.org",
	notifications = {
		enabled = false,
		cron_enabled = true,
		repeater_reminder_time = false,
		deadline_warning_reminder_time = false,
		reminder_time = 10,
		deadline_reminder = true,
		scheduled_reminder = true,
		notifier = function(tasks)
			local result = {}
			for _, task in ipairs(tasks) do
				require("orgmode.utils").concat(result, {
					string.format("# %s (%s)", task.category, task.humanized_duration),
					string.format("%s %s %s", string.rep("*", task.level), task.todo, task.title),
					string.format("%s: <%s>", task.type, task.time:to_string()),
				})
			end

			if not vim.tbl_isempty(result) then
				require("orgmode.notifications.notification_popup"):new({ content = result })
			end
		end,
		cron_notifier = function(tasks)
			for _, task in ipairs(tasks) do
				local title = string.format("%s (%s)", task.category, task.humanized_duration)
				local subtitle = string.format("%s %s %s", string.rep("*", task.level), task.todo, task.title)
				local date = string.format("%s: %s", task.type, task.time:to_string())

				-- Linux
				if vim.fn.executable("notify-send") == 1 then
					vim.loop.spawn("notify-send", { args = { string.format("%s\n%s\n%s", title, subtitle, date) } })
				end

				-- MacOS
				if vim.fn.executable("terminal-notifier") == 1 then
					vim.loop.spawn(
						"terminal-notifier",
						{ args = { "-title", title, "-subtitle", subtitle, "-message", date } }
					)
				end
			end
		end,
	},
	-- Mapping
	mappings = {
		agenda = {
			org_agenda_later = ">",
			org_agenda_earlier = "<",
			org_agenda_goto_today = { ".", "T" },
		},
		-- Org custom repot
		org_custom_exports = {
			f = {
				label = "Export to RTF format",
				action = function(exporter)
					local current_file = vim.api.nvim_buf_get_name(0)
					local target = vim.fn.fnamemodify(current_file, ":p:r") .. ".rtf"
					local command = { "pandoc", current_file, "-o", target }
					local on_success = function(output)
						print("Success!")
						vim.api.nvim_echo({ { table.concat(output, "\n") } }, true, {})
					end
					local on_error = function(err)
						print("Error!")
						vim.api.nvim_echo({ { table.concat(err, "\n"), "ErrorMsg" } }, true, {})
					end
					return exporter(command, target, on_success, on_error)
				end,
			},
		},
	},
	org_todo_keywords = { "TODO", "WAITING", "|", "DONE", "DELEGATED" },
	org_todo_keyword_faces = {
		WAITING = ":foreground blue :weight bold",
		DELEGATED = ":background #FFFFFF :slant italic :underline on",
		TODO = ":background #000000 :foreground red", -- overrides builtin color for `TODO` keyword
	},
})
