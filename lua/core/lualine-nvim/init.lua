local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diff = {
	"diff",
	colored = false,
	symbols = { added = "  ", modified = " ", removed = " " },
	cond = hide_in_width,
}
require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		disabled_filetypes = {'dashboard', 'NvimTree', 'Outline', 'Terminal'},
		section_separators = {
			left = "",
			right = "",
		},
		component_separators = {
			left = "",
			right = "",
		},
	},

	sections = {
		lualine_a = { "branch" },
		lualine_b = { "hostname" },
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
		lualine_x = { "location", "tabs", "encoding" },
		lualine_y = { diff },
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

