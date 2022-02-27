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

opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines
vim.g.tokyonight_style = "storm"


-- Url handler
--
-- local map = require('utils').map
-- if vim.fn.has("mac") == 1 then
--     map[''].gx = {'<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>'}
-- elseif vim.fn.has("uni") == 1 then
--     map[''].gx = {'<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>'}
-- else
--     map[''].gx = {'<Cmd>lua print("Error: gx is not supported on this OS!")<CR>'}
-- end
--


vim.cmd([[
filetype indent on
set autoindent
set smartindent
colorscheme onedark
]])

exec([[
  autocmd BufEnter,BufNew term://* startinsert
  autocmd TermOpen * startinsert
  autocmd TermOpen * setlocal nonumber norelativenumber
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}
  augroup end
]], false)
