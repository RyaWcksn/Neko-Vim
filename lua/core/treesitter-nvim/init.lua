require("nvim-treesitter.configs").setup({
	require('utils.nekorc').languages.ensure_installed,
	sync_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
