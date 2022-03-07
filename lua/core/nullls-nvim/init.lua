local null = require("null-ls")
local formatting = null.builtins.formatting

local formats = {
	formatting.gofmt,
    formatting.goimports,
	formatting.golines,
}

null.setup({
	sources = formats,
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()
            augroup END
            ]])
		end
	end,
})
