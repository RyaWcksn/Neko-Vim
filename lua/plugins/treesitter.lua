require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "go", "lua", "typescript", "python" },
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting= false,
    incremental_selection = { enable = true },
    indent = { enable = true },
    autopairs = { enable = true },
    autotag = { enable = true },
    textsubjects = { enable = true },
    context_commentstring = { enable = true }
  },
}
