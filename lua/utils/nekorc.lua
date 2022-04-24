local M = {}
local lua_gps = require("nvim-gps")

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

M.colors = {
  bg       = '#000000',
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

-- Enter your colorscheme name here
M.colorscheme = "moonfly"

-- Light or Dark
M.colorstyle = "dark"

-- Enter your lualine colorscheme name here
M.lualine_theme = "16color"

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
        color = { fg = '#ffffff', bg = '#000000' },
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
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = false, -- Show diagnostics even if there are none.
    },
    branch = {
        "branch",
        cond = hide_in_width,
        icon = " ",
        color = { fg = '#ffffff', bg = '#000000' },
    },
    gps = {
        lua_gps.get_location,
	    cond = lua_gps.is_available
    },
    mode = {
        function ()
            return ""
        end,
        color = function ()
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
	},
    -- Treesitter
	ensure_installed = { "html", "javascript", "lua", "go", "typescript" },
}

return M
