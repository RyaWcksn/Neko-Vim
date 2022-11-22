local module = require('utils.nekorc')
local M = {}

M.setup = function()
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local config = {
        virtual_text = true,
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
        border = "single",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
    })

    vim.api.nvim_set_hl(0, 'LspCodeLens', { link = 'LspDiagnosticsHint', default = true })
    vim.api.nvim_set_hl(0, 'LspCodeLensText', { link = 'LspDiagnosticsInformation', default = true })
    vim.api.nvim_set_hl(0, 'LspCodeLensSign', { link = 'LspDiagnosticsInformation', default = true })
    vim.api.nvim_set_hl(0, 'LspCodeLensSeparator', { link = 'Boolean', default = true })

    vim.o.updatetime = 250
    vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])
    if vim.fn.mode == "i" then
        vim.cmd([[autocmd! CursorHold,CursorHoldI,CursorMovedI * lua vim.lsp.buf.signature_help(nil, {focus=false, scope="cursor"})]])
    end

    local Handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" }),
    }

    local servers = module.languages.servers
    for _, server in ipairs(servers) do
        if server == "gopls" then
            module.gopls(Handlers)
        end
        if server == "golangci_lint_ls" then
            module.golang_ci(Handlers)
        end
        if server == "grammarly" then
            module.grammarly()
        end
        --[[ if server == "jdtls" then
            module.jdtls(Handlers)
        end ]]
    end
end

return M
