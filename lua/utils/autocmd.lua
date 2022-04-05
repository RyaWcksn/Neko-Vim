vim.cmd([[
autocmd BufEnter :silent! ColorizerAttachToBuffer
augroup LspFormatting
    autocmd! * <buffer>
    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
augroup END
]])

