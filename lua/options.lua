local opt = vim.opt
local g = vim.g
local exec = vim.api.nvim_exec
local fn = vim.fn

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
opt.foldmethod = "manual"
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
g.vimwiki_listsyms = "✗○◐●✓"
--opt.colorcolumn="90"
vim.wo.wrap = false

opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines

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
]])

exec([[
  autocmd BufEnter,BufNew term://* startinsert
  autocmd TermOpen * startinsert
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)
