local lsp = require('lspconfig')
local M = {}

M.setup = function ()
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }
    vim.diagnostic.config(config)
    vim.api.nvim_command("au BufWritePost <buffer> lua vim.lsp.buf.formatting()")
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
      border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
      border = "rounded",
    })

    vim.o.updatetime = 250
    vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
    vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])
	local servers = {
		"bashls",
		"vuels",
		"cssls",
		"html",
		"jsonls",
		"sumneko_lua",
		"phpactor",
		"pyright",
		"solargraph",
		"tsserver",
        "gopls",
        "golangci-lint",
	}
    for _, server in ipairs(servers) do
        if server == "gopls" then
            lsp.gopls.setup({
                capabilities = {
                      textDocument = {
                        completion = {
                          completionItem = {
                            commitCharactersSupport = true,
                            deprecatedSupport = true,
                            documentationFormat = { "markdown", "plaintext" },
                            preselectSupport = true,
                            insertReplaceSupport = true,
                            labelDetailsSupport = true,
                            snippetSupport = true,
                            resolveSupport = {
                              properties = {
                                "documentation",
                                "details",
                                "additionalTextEdits",
                              },
                            },
                          },
                          contextSupport = true,
                          dynamicRegistration = true,
                        },
                      },
                    },
                    filetypes = { "go", "gomod", "gohtmltmpl", "gotexttmpl" },
                    message_level = vim.lsp.protocol.MessageType.Error,
                    cmd = {
                      "gopls", -- share the gopls instance if there is one already
                      "-remote.debug=:0",
                    },
                    root_dir = function(fname)
                      local has_lsp, lspconfig = pcall(require, "lspconfig")
                      if has_lsp then
                        local util = lspconfig.util
                        return util.root_pattern("go.mod", ".git")(fname) or util.path.dirname(fname)
                      end
                    end,
                    flags = { allow_incremental_sync = true, debounce_text_changes = 500 },
                    settings = {
                      gopls = {
                        -- more settings: https://github.com/golang/tools/blob/master/gopls/doc/settings.md
                        -- flags = {allow_incremental_sync = true, debounce_text_changes = 500},
                        -- not supported
                        analyses = { unusedparams = true, unreachable = false },
                        codelenses = {
                          generate = true, -- show the `go generate` lens.
                          gc_details = true, --  // Show a code lens toggling the display of gc's choices.
                          test = true,
                          tidy = true,
                        },
                        usePlaceholders = true,
                        completeUnimported = true,
                        staticcheck = true,
                        matcher = "Fuzzy",
                        diagnosticsDelay = "500ms",
                        experimentalWatchedFileDelay = "100ms",
                        symbolMatcher = "fuzzy",
                        ["local"] = "",
                        gofumpt = false, -- true, -- turn on for new repos, gofmpt is good but also create code turmoils
                        buildFlags = { "-tags", "integration" },
                        -- buildFlags = {"-tags", "functional"}
                      },
                    },
            })
        end
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

require("lspconfig").gopls.setup{
}
M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
