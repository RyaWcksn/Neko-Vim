require("nvim-treesitter.configs").setup({
	ensure_installed = { "html", "javascript", "lua", "go", "typescript" },
	sync_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
