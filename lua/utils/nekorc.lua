local M = {}

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

-- Enter your colorscheme name here
M.colorscheme = "base16-tomorrow-night"

-- Enter your lualine colorscheme name here
M.lualine_theme = "moonfly"

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
    }
}

-- Input languages LSP to install
M.languages = {
	servers = {
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
	},
    -- Treesitter
	ensure_installed = { "html", "javascript", "lua", "go", "typescript" },
}

return M
