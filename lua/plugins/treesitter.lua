require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "go", "lua", "typescript", "python" },
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting= false,
  },
} 
