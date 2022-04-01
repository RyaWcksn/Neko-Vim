local opt = vim.opt
local g = vim.g
local exec = vim.api.nvim_exec

opt.fillchars = { eob = " " }

local colorscheme = require('utils.nekorc').colorscheme

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  print("Error loading colorscheme: " .. colorscheme)
end

opt.undofile = true
opt.ruler = false
opt.hidden = true
opt.ignorecase = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.cul = true
opt.mouse = "a"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.updatetime = 250 -- update interval for gitsigns
opt.timeoutlen = 400
opt.clipboard = "unnamedplus"
opt.clipboard = "unnamed"
opt.foldmethod = "manual"
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
g.vimwiki_listsyms = "X"
--opt.colorcolumn="90"
vim.wo.wrap = false
-- Outline

vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = true,
    position = 'right',
    relative_width = true,
    width = 25,
    auto_close = false,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = 'Pmenu',
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols = {
        File = {icon = "", hl = "TSURI"},
        Module = {icon = "", hl = "TSNamespace"},
        Namespace = {icon = "", hl = "TSNamespace"},
        Package = {icon = "", hl = "TSNamespace"},
        Class = {icon = "ﴯ", hl = "TSType"},
        Method = {icon = "", hl = "TSMethod"},
        Property = {icon = "ﰠ", hl = "TSMethod"},
        Field = {icon = "", hl = "TSField"},
        Constructor = {icon = "", hl = "TSConstructor"},
        Enum = {icon = "", hl = "TSType"},
        Interface = {icon = "", hl = "TSType"},
        Function = {icon = "", hl = "TSFunction"},
        Variable = {icon = "", hl = "TSConstant"},
        Constant = {icon = "", hl = "TSConstant"},
        String = {icon = "𝓐", hl = "TSString"},
        Number = {icon = "#", hl = "TSNumber"},
        Boolean = {icon = "⊨", hl = "TSBoolean"},
        Array = {icon = "", hl = "TSConstant"},
        Object = {icon = "⦿", hl = "TSType"},
        Key = {icon = "🔐", hl = "TSType"},
        Null = {icon = "NULL", hl = "TSType"},
        EnumMember = {icon = "", hl = "TSField"},
        Struct = {icon = "𝓢", hl = "TSType"},
        Event = {icon = "🗲", hl = "TSType"},
        Operator = {icon = "+", hl = "TSOperator"},
        TypeParameter = {icon = "𝙏", hl = "TSParameter"}
    }
}

opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 4 -- shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines
vim.g.tokyonight_style = "night"
g.db_ui_save_location = "~/"

local global_pkg_settings = {
    netrw_silent = 1,
    loaded_2html_plugin = 1,
    loaded_gzip = 1,
    loaded_man = 1,
    loaded_matchit = 1,
    loaded_matchparen = 1,
    loaded_shada_plugin = 1,
    loaded_spellfile_plugin = 1,
    loaded_tarPlugin = 1,
    loaded_tutor_mode_plugin = 1,
    loaded_vimballPlugin = 1,
    loaded_zipPlugin = 1,
    loaded_netrwPlugin = 1,
    loaded_python_provider = 0,
    loaded_ruby_provider = 0,
    loaded_perl_provider = 0,
    loaded_node_provider = 0,
    netrw_use_noswf = 0
}

for k, v in pairs(global_pkg_settings) do vim.g[k] = v end

vim.cmd([[
filetype indent on
set autoindent
set smartindent
]])

exec(
	[[
  autocmd BufEnter,BufNew term://* startinsert
  autocmd TermOpen * startinsert
  autocmd TermOpen * setlocal nonumber norelativenumber
  autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}
  augroup end
]],
	false
)