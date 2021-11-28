local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}
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
