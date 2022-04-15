local M = {}
local lua_gps = require("nvim-gps")

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

-- Enter your colorscheme name here
M.colorscheme = "moonfly"

-- Enter your lualine colorscheme name here
M.lualine_theme = "moonfly"

-- Enter your leader key
M.leader = " "

-- Lualine components
M.lualine_modules = {
    treesitter = {
        function()
            local b = vim.api.nvim_get_current_buf()
                if next(vim.treesitter.highlighter.active[b]) then
                    return ""
                end
            return ""
        end,
    },
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
    },
    gps = {
        lua_gps.get_location,
	    cond = lua_gps.is_available
    },
    mode = {
        function ()
            return ""
        end
    },
    keymap = {
        function ()
            if vim.opt.iminsert:get() > 0 and vim.b.keymap_name then
                return '⌨ ' .. vim.b.keymap_name
            end
            return ''
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
