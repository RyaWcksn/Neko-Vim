if vim.fn.has("unix") == 1 then
    require("indent_blankline").setup{
            char = "│",
            buftype_exclude = {"terminal", "nvim-lsp-installer"},
            filetype_exclude = {"dashboard", "nvimtree", "packer", "nvim-lsp-installer"},
            show_current_context = true,
            show_current_context_start = true,
    }
elseif vim.fn.has("mac") == 1 then
    require("indent_blankline").setup{
            char = "│",
            buftype_exclude = {"terminal", "nvim-lsp-installer"},
            filetype_exclude = {"dashboard", "nvimtree", "packer", "nvim-lsp-installer"},
    }
end
