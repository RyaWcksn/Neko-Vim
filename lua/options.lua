local opt = vim.opt
local g = vim.g
local exec = vim.api.nvim_exec

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
-- transparency

opt.expandtab = true -- use spaces instead of tabs
opt.shiftwidth = 4 -- shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- autoindent new lines
vim.g.tokyonight_style = "night"
g.db_ui_save_location = "~/"

vim.cmd([[
filetype indent on
set autoindent
set smartindent
colorscheme tokyonight
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
