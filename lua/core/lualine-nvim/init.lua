local module = require('utils.nekorc')

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = require("utils.nekorc").lualine_theme,
		disabled_filetypes = {'dashboard', 'NvimTree', 'Outline', 'Terminal'},
		section_separators = {
			left = "",
			right = "",
		},
		component_separators = {
			left = "",
			right = "",
		},
	},

	sections = {
		lualine_a = { "branch" },
		lualine_b = { 'hostname', module.lualine_modules.treesitter },
		lualine_c = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic", "nvim_lsp" },
				sections = { "error", "warn", "info", "hint" },
				diagnostics_color = {
					error = "DiagnosticError", -- Changes diagnostics' error color.
					warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
					info = "DiagnosticInfo", -- Changes diagnostics' info color.
					hint = "DiagnosticHint", -- Changes diagnostics' hint color.
				},
				symbols = { error = " ", warn = " ", info = " ", hint = " " },
				colored = true, -- Displays diagnostics status in color if set to true.
				update_in_insert = false, -- Update diagnostics in insert mode.
				always_visible = false, -- Show diagnostics even if there are none.
			},
		},
		lualine_x = { "location", module.lualine_modules.lsp, "encoding" },
		lualine_y = { module.lualine_modules.diff },
		lualine_z = { "filetype" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "hostname" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = { "nvim-tree" },
})

