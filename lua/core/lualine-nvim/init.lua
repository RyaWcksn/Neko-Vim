local module = require('utils.nekorc')

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = module.lualine_theme,
		disabled_filetypes = {'dashboard', 'NvimTree', 'Outline', 'Terminal'},
		section_separators = {
			left = "",
			right = "",
		},
		component_separators = {
			left = "",
			right = "",
		},
	},

	sections = {
		lualine_a = {},
		lualine_b = { module.lualine_modules.mode, module.lualine_modules.branch, module.lualine_modules.user },
		lualine_c = {},
		lualine_x = {},
        lualine_y = { module.lualine_modules.diagnostic, module.lualine_modules.diff },
		lualine_z = {},

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

