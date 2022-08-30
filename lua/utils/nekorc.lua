local M = {}
local api = vim.api
local lsp = require('lspconfig')

local hide_in_width = function()
    return vim.fn.winwidth(0) > 80
end

M.colors = {
    bg       = '#262626',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}

function os.capture(cmd, raw)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()
    if raw then return s end
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')
    return s
end

function M.nvim_create_augroups(definitions)
    for group_name, definition in pairs(definitions) do
        api.nvim_command('augroup ' .. group_name)
        api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten { 'autocmd', def }, ' ')
            api.nvim_command(command)
        end
        api.nvim_command('augroup END')
    end
end

-- Enter your colorscheme name here
M.colorscheme = "everblush"

-- Light or Dark
M.colorstyle = "dark"

-- Enter your lualine colorscheme name here
M.lualine_theme = "vscode"

-- Enter your leader key
M.leader = " "

-- Lualine components
M.lualine_modules = {
    lsp = {
        function()
            local msg = 'No Active Lsp'
            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
            local clients = vim.lsp.get_active_clients()
            if next(clients) == nil then
                return msg
            end
            for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return client.name
                end
            end
            return msg
        end,
        icon = ' LSP:',
        color = { fg = '#ffffff', gui = 'bold' },
    },
    diff = {
        "diff",
        colored = false,
        symbols = { added = "  ", modified = " ", removed = " " },
        cond = hide_in_width,
        color = { fg = '#ffffff', bg = '#262626' },
    },
    diagnostic = {
        "diagnostics",
        sources = { "nvim_diagnostic", "nvim_lsp" },
        sections = { "error", "warn", "info", "hint" },
        diagnostics_color = {
            error = "DiagnosticError", -- Changes diagnostics' error color.
            warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
            info = "DiagnosticInfo", -- Changes diagnostics' info color.
            hint = "DiagnosticHint", -- Changes diagnostics' hint color.
        },
        symbols = { error = " ", warn = " ", info = " ", hint = " " },
        colored = true, -- Displays diagnostics status in color if set to true.
        update_in_insert = true, -- Update diagnostics in insert mode.
        always_visible = false, -- Show diagnostics even if there are none.
        color = { fg = '#ffffff', bg = '#262626' },
    },
    branch = {
        "branch",
        cond = hide_in_width,
        icon = " ",
        color = { fg = '#ffffff', bg = '#262626' },
    },
    user = {
        function()
            local user = os.capture("git config --get user.name")
            return " " .. user
        end,
        color = { fg = '#ffffff', bg = '#262626' },
    },
    mode = {
        function()
            return ""
        end,
        color = function()
            local mode_color = {
                n = M.colors.magenta,
                i = M.colors.green,
                v = M.colors.blue,
                [''] = M.colors.blue,
                V = M.colors.blue,
                c = M.colors.magenta,
                no = M.colors.red,
                s = M.colors.orange,
                S = M.colors.orange,
                [''] = M.colors.orange,
                ic = M.colors.yellow,
                R = M.colors.violet,
                Rv = M.colors.violet,
                cv = M.colors.red,
                ce = M.colors.red,
                r = M.colors.cyan,
                rm = M.colors.cyan,
                ['r?'] = M.colors.cyan,
                ['!'] = M.colors.red,
                t = M.colors.red,
            }
            return { fg = mode_color[vim.fn.mode()], bg = M.colors.bg }
        end
    },
}

vim.g.vscode_style = "dark"
vim.g.vscode_transparent = 0
vim.g.vscode_italic_comment = 1
vim.g.vscode_disable_nvimtree_bg = true

-- Input languages LSP to install
M.languages = {
    servers = {
        "bashls",
        "jsonls",
        "sumneko_lua",
        "pyright",
        "tsserver",
        "gopls",
        "golangci_lint_ls",
        "rust_analyzer",
    },
    -- Treesitter
    ensure_installed = { "bash", "javascript", "lua", "go", "typescript" },
}

M.on_attach = function(client, bufnr)
    if vim.g.vim_version > 7 then
        -- nightly
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
    else
        -- stable
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end

    lsp.utils.load_mappings("lspconfig", { buffer = bufnr })
end

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = cmp_nvim_lsp.update_capabilities(M.capabilities)
M.capabilities.textDocument.completion.completionItem = {
    documentationFormat = { "markdown", "plaintext" },
    snippetSupport = true,
    preselectSupport = true,
    insertReplaceSupport = true,
    labelDetailsSupport = true,
    deprecatedSupport = true,
    commitCharactersSupport = true,
    tagSupport = { valueSet = { 1 } },
    resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    },
}

function M.gopls(handler)
    return lsp.gopls.setup({
        handlers = handler,
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gotmpl" },
        root_dir = lsp.util.root_pattern("go.mod", ".git", "go.sum"),
        single_file_support = true,
        default_config = {
            init_options = {
                analyses = {
                    unusedparams = true,
                },
                codelenses = {
                    test = true,
                    generate = true,
                    gc_details = true,
                    regenerate_cgo = true,
                    tidy = true,
                    upgrade_depdendency = true,
                    vendor = true,
                },
            },
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                    },
                    staticcheck = true,
                    signatureHelp = {
                        enabled = true,
                    },
                    linksInHover = false,
                    usePlaceholders = true,
                },
            },
        }
    })
end

function M.golang_ci(handler)
    return lsp.golangci_lint_ls.setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        cmd = { 'golangci-lint-langserver' },
        root_dir = lsp.util.root_pattern('.git', 'go.mod'),
        handlers = handler,
        filetypes = { 'go', 'gomod' },
        default_config = {
            init_options = {
                command = { "golangci-lint", "run", "--enable-all", "--disable", "lll", "--out-format", "json" };
                analyses = {
                    unusedparams = true,
                },
                codelenses = {
                    test = true,
                    generate = true,
                    gc_details = true,
                    regenerate_cgo = true,
                    tidy = true,
                    upgrade_depdendency = true,
                    vendor = true,
                },
            };
        },
    }
end

function M.rust_analyzer(handler)
    return lsp.rust_analyzer.setup {
        handlers = handler,
        on_attach = M.on_attach,
        capabilities = M.capabilities,
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        root_dir = lsp.util.root_pattern("Cargo.toml", "rust-project.json"),
        settings = {
            ["rust-analyzer"] = {}
        }
    }
end

return M
