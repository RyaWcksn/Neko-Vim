local module = require("utils.nekorc")

vim.g.mapleader = module.leader

local opt = {silent = true, noremap = true}
local key = vim.api.nvim_set_keymap

-- Disable key
vim.cmd([[
noremap . <NOP>
]])

-- Stuff
key("n", "Y", "y$", opt)
key("n", "J", "mzJ`z", opt)
key("n", "n", "nzzzv", opt)
key("n", "N", "Nzzzv", opt)
key("n", "<C-L>", "zL", opt)
key("n", "<C-H>", "zH", opt)

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

-- DAP
key("n", "<F3>", ":DapToggleBreakpoint<CR>", opt)

-- Using jk as ESC
key("t", "jk", "<C-\\><C-n>", opt)
key("i", "jk", "<esc>", opt)

-- Terminal Float
--[[ key("i", "<F2>", "<Esc>:FloatermToggle<CR>", opt)
key("n", "<F2>", "<C-\\><C-n>:FloatermToggle<CR>", opt)
key("t", "<F2>", "<C-\\><C-n>:FloatermToggle<CR>", opt) ]]
key("t", "<F2>", "<C-\\><C-n>:ToggleTerm<CR>", opt)
key("i", "<F2>", "<C-\\><C-n>:ToggleTerm<CR>", opt)
key("n", "<F2>", ":ToggleTerm<CR>", opt)

-- Hop word
key("n", "W", ":HopWord<CR>", opt)

-- Carbon Now Sha
key("v", "<F5>", ":CarbonNowSh<CR>", opt)

-- Comment
key("n", "<Leader>/", "<Plug>kommentary_line_default", opt)
key("v", "<Leader>/", "<Plug>kommentary_visual_default<C-c>", opt)

key("n", "<Up>", "<C-u>", opt)
key("n", "<Down>", "<C-d>", opt)

-- Unix specified keybinding, using meta as leader key
if vim.fn.has("unix") then
	key("n", "<A-w>", ":w <CR>", opt)
    key("i", "<A-w>", "<c-\\><c-n>:w <CR>", opt)

	key("n", "<A-q>", ":bd! <CR>", opt)
	key("n", "<A-c>", ":bd<CR>", opt)

	key("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", opt)
	key("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", opt)
	key("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", opt)
	key("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", opt)
	key("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", opt)
	key("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", opt)
	key("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", opt)
	key("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>", opt)
	key("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>", opt)
	key("n", "<A-0>", ":BufferLineGoToBuffer 0<CR>", opt)

    key("n", "<A-[>", ":BufferLineCyclePrev<CR>", opt)
    key("n", "<A-]>", ":BufferLineCycleNext<CR>", opt)

	key("n", "<A-f>", "<cmd>FZF<CR>", opt)
	key("n", "<A-s>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opt)
	key("n", "<A-b>", "<cmd>Telescope buffers<CR>", opt)
	key("n", "<A-t>", ":Telescope colorscheme<CR>", opt)

	key("n", "<A-h>", "<C-w>h", opt)
	key("n", "<A-j>", "<C-w>j", opt)
	key("n", "<A-k>", "<C-w>k", opt)
	key("n", "<A-l>", "<C-w>l", opt)

    key("n", "<A-_>", ":sp<CR>", opt)
	key("n", "<A-|>", ":vs<CR>", opt)

	key("n", "<A-d>", ":Trouble<CR>", opt)
	key("n", "<A-z>", ":ZenMode<CR>", opt)

	key("n", "<A-r>", "<cmd>lua Rename.rename()<CR>", opt)
	key("n", "<A-a>", ":Telescope lsp_code_actions<CR>", opt)

	key("n", "<A-u>", ":DBUIToggle<CR>", opt)
	key("n", "<A-LeftMouse>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opt)

    key("n", "<A-o>", ":SymbolsOutline<CR>", opt)

    key("n", "<A-/>", "<Plug>kommentary_line_default", opt)
    key("v", "<A-/>", "<Plug>kommentary_visual_default<C-c>", opt)
end
