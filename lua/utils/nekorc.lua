local M = {}
local api = vim.api

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
        api.nvim_command('augroup '..group_name)
        api.nvim_command('autocmd!')
        for _, def in ipairs(definition) do
            local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
            api.nvim_command(command)
        end
        api.nvim_command('augroup END')
    end
end

--[[ local lsp_util = vim.lsp.util

function M.code_action_listener()
  local context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
  local params = lsp_util.make_range_params()
  params.context = context
  vim.lsp.buf_request(0, 'textDocument/codeAction', params, function(err, _, result)
    -- do something with result - e.g. check if empty and show some indication such as a sign
    if result == nil then
       print(err)
    end
  end)
end ]]

-- Enter your colorscheme name here
M.colorscheme = "vscode"

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
-- vim.g.vscode_transparent = 0
vim.g.vscode_italic_comment = 1
-- vim.g.vscode_disable_nvimtree_bg = true

-- Input languages LSP to install
M.languages = {
    servers = {
        "bashls",
        "cssls",
        "html",
        "jsonls",
        "sumneko_lua",
        "pyright",
        "tsserver",
        "gopls",
        "robotframework_ls",
    },
    -- Treesitter
    ensure_installed = { "html", "javascript", "lua", "go", "typescript" },
}

return M
