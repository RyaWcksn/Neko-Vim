local module = require("utils.nekorc")

vim.g.mapleader = module.leader

local opt = {silent = true, noremap = true}
local key = vim.api.nvim_set_keymap

-- Disable key

-- Stuff
key("n", "Y", "y$", opt)
key("n", "J", "mzJ`z", opt)
key("n", "n", "nzzzv", opt)
key("n", "N", "Nzzzv", opt)
key("n", "<C-L>", "zL", opt)
key("n", "<C-H>", "zH", opt)

key("n", "t", "vt", opt)
key("n", "f", "vf", opt)
key("n", "T", "vT", opt)
key("n", "F", "vF", opt)

-- LSP
key("n", "lD", ":lua vim.lsp.buf.declaration()<CR>", opt)
key("n", "ld", ":lua vim.lsp.buf.definition()<CR>", opt)
key("n", "K", ":lua vim.lsp.buf.hover()<CR>", opt)

-- Indent
key("v", "J", ":m '>+1<CR>gv=gv", opt)
key("v", "K", ":m '<-2<CR>gv=gv", opt)
key("v", "L", ">gv", opt)
key("v", "H", "<gv", opt)

-- Using ; to Command mode
key("n", ";", ":", opt)
key("n", "/", ":SearchBoxIncSearch<CR>", opt)
key("n", ".", ":SearchBoxReplace<CR>", opt)

-- DAP
key("n", "<F3>", ":DapToggleBreakpoint<CR>", opt)

-- Using jk as ESC
key("t", "jk", "<C-\\><C-n>", opt)
key("i", "jk", "<esc>", opt)


-- Unix specified keybinding, using meta as leader key
