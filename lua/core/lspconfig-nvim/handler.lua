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
	}
    for _, server in ipairs(servers) do
        local util = require("lspconfig/util")
        if server == "gopls" then
            lsp.gopls.setup({
                cmd = {"gopls", "serve", "goimports"},
                filetypes = {"go", "gomod", "gotmpl"},
                root_dir = util.root_pattern("go.work", "go.mod", ".git", "go.sum"),
                single_file_support = true,
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                    },
                },
            })
        end
        --[[ if server == "golangci_lint_ls" then
           lsp.golangci_lint_ls.setup({
                cmd = {"golangci-lint-langserver"},
                init_options = {
                    command = { "golangci-lint", "run", "--out-format", "json" }
                },
                filetypes = {"go", "gomod"},
                root_dir = util.root_pattern("go.work", "go.mod", ".git", "go.sum"),
                settings = {
                    golangci_lint_ls = {
                        enable_all = true,
                        enable = {
                            "golint",
                            "govet",
                            "golint",
                            "goconst",
                            "gocyclo",
                            "ineffassign",
                            "interfacer",
                            "structcheck",
                            "unused",
                            "unusedparams",
                            "varcheck",
                        },
                    },
                },
            })
        end ]]
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end
M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
