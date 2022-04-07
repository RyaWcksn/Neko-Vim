local lsp = require('lspconfig')
local module = require('utils.nekorc')
local M = {}

local sumneko_binary_path = vim.fn.exepath('lua-language-server')
local sumneko_root_path = vim.fn.fnamemodify(sumneko_binary_path, ':h:h:h')

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")


M.setup = function ()
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local config = {
        -- disable virtual text
        virtual_text = true,
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
    -- vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]])
    -- vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.lsp.buf.hover(nil, {focus=false})]])
	local servers = module.languages.servers
    local util = require("lspconfig/util")

    for _, server in ipairs(servers) do
        if server == "sumneko_lua" then
            lsp.sumneko_lua.setup({
                cmd = {sumneko_binary_path, "-E", sumneko_root_path .. "/main.lua"};
                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                            -- Setup your lua path
                            path = runtime_path,
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = {'vim'},
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
        end
        if server == "gopls" then
            lsp.gopls.setup({
                cmd = {"gopls", "serve"},
                filetypes = {"go", "gomod", "gotmpl"},
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
    end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end
M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
