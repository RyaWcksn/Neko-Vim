vim.cmd([[
autocmd BufEnter :silent! ColorizerAttachToBuffer
augroup LspFormatting
    autocmd! * <buffer>
    autocmd BufWritePost *.go silent! LspRestart
    autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
augroup END
]])

