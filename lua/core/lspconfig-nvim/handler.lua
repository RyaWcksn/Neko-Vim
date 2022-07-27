local lsp = require('lspconfig')
local module = require('utils.nekorc')
local M = {}

M.setup = function()
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
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
    -- vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
    vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])
    -- vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.lsp.buf.hover(nil, {focus=false})]])
    -- vim.cmd([[autocmd! CursorHold,CursorHoldI *.go lua vim.lsp.buf.signature_help(nil, {focus=false})]])

    local Handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
    }

    local servers = module.languages.servers
    local util = require("lspconfig/util")
    for _, server in ipairs(servers) do
        if server == "gopls" then
            lsp.gopls.setup({
                handlers = Handlers,
                cmd = { "gopls", "serve" },
                filetypes = { "go", "gomod", "gotmpl" },
                root_dir = util.root_pattern("go.work", "go.mod", ".git", "go.sum"),
                single_file_support = true,
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                        },
                        staticcheck = true,
                        signatureHelp = {
                            enabled = true,
                        },
                        codelens = {
                            generate = true,
                            gc_details = true,
                            regenerate_cgo = true,
                            tidy = true,
                            upgrade_depdendency = true,
                            vendor = true,
                        },
                        linksInHover = false,
                        usePlaceholders = true,
                    },
                },
            })
        end

        if server == "robotframework_ls" then
            lsp.robotframework_ls.setup {
                cmd = { "robotframework_ls" },
                filetypes = { "robot" },
                root_dir = util.root_pattern('robotidy.toml', 'pyproject.toml')(fname) or util.find_git_ancestor(fname)
            }
        end
    end
end



local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end
M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
M.capabilities.textDocument.completion.completionItem.documentationFormat = { "markdown", "plaintext" }
M.capabilities.textDocument.completion.completionItem.snippetSupport = true
M.capabilities.textDocument.completion.completionItem.preselectSupport = true
M.capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
M.capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
M.capabilities.textDocument.completion.completionItem.deprecatedSupport = true
M.capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
M.capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
M.capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
    },
}

return M
