local module = require('utils.nekorc')

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = module.lualine_theme,
		disabled_filetypes = {'dashboard', 'NvimTree', 'Outline', 'Terminal'},
		section_separators = {
			left = "",
			right = "",
		},
		component_separators = {
			left = " ",
			right = " ",
		},
	},

	sections = {
		lualine_a = { module.lualine_modules.mode },
		lualine_b = { module.lualine_modules.lsp, module.lualine_modules.gps, module.lualine_modules.diagnostic},
		lualine_c = { },
		lualine_x = { "location", module.lualine_modules.branch},
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

