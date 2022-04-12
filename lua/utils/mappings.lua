local module = require("utils.nekorc")

vim.g.mapleader = module.leader

local opt = {silent = true, noremap = true}
local key = vim.api.nvim_set_keymap

-- Disable key
vim.cmd([[
noremap . <NOP>
]])

-- Go mock key
function GolangMock()
    local file = vim.trim(vim.fn.expand("%"))
    local output = file:match"(.+)%..+$" .. "_mock.go"
    local package = vim.fn.input("Package name: ")
    local cmd = {"mockgen", "-source", file, "-destination", output, "-package", package}
    os.execute(table.concat(cmd, " "))
    print(", Mock file generated: " .. output .. " Package: " .. package)
end

-- Stuff
key("n", "Y", "y$", opt)
key("n", "J", "mzJ`z", opt)
key("n", "n", "nzzzv", opt)
key("n", "N", "Nzzzv", opt)
key("n", "j", "gj", opt)
key("n", "k", "gk", opt)
key("n", "<C-L>", "zL", opt)
key("n", "<C-H>", "zH", opt)

-- Mock golang
key("n", "<Leader>cm", ":lua GolangMock()<CR>", opt)

-- LSP
key("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opt)
key("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opt)
key("n", "K", ":lua vim.lsp.buf.hover()<CR>", opt)

-- Indent
key("v", "J", ":m '>+1<CR>gv=gv", opt)
key("v", "K", ":m '<-2<CR>gv=gv", opt)
key("v", "L", ">gv", opt)
key("v", "H", "<gv", opt)

-- Nvim Tree
key("n", "<F1>", ":NvimTreeToggle<CR>", opt)

-- Using ; to Command mode
key("n", ";", ":", opt)

-- Using jk as ESC
key("t", "jk", "<C-\\><C-n>", opt)
key("i", "jk", "<esc>", opt)

-- Terminal Float
key("i", "<F2>", "<Esc>:FloatermToggle<CR>", opt)
key("n", "<F2>", "<C-\\><C-n>:FloatermToggle<CR>", opt)
key("t", "<F2>", "<C-\\><C-n>:FloatermToggle<CR>", opt)

-- Zen mode
key("n", "<Leader>zz", ":ZenMode<CR>", opt)

-- Buffer tabbing
key("n", "<Leader>1", ":BufferLineGoToBuffer 1<CR>", opt)
key("n", "<Leader>2", ":BufferLineGoToBuffer 2<CR>", opt)
key("n", "<Leader>3", ":BufferLineGoToBuffer 3<CR>", opt)
key("n", "<Leader>4", ":BufferLineGoToBuffer 4<CR>", opt)
key("n", "<Leader>5", ":BufferLineGoToBuffer 5<CR>", opt)
key("n", "<Leader>6", ":BufferLineGoToBuffer 6<CR>", opt)
key("n", "<Leader>7", ":BufferLineGoToBuffer 7<CR>", opt)
key("n", "<Leader>8", ":BufferLineGoToBuffer 8<CR>", opt)
key("n", "<Leader>9", ":BufferLineGoToBuffer 9<CR>", opt)
key("n", "<Leader>0", ":BufferLineGoToBuffer 0<CR>", opt)

-- Hop word
key("n", "e", ":HopWord<CR>", opt)
key("x", "e", ":HopLineStartAC<CR>", opt)

-- Carbon Now Sha
key("v", "<F5>", ":CarbonNowSh<CR>", opt)

-- Comment
key("n", "<Leader>/", "<Plug>kommentary_line_default", opt)
key("v", "<Leader>/", "<Plug>kommentary_visual_default<C-c>", opt)

-- Unix specified keybinding, using meta as leader key
if vim.fn.has("unix") then
	key("n", "<M-w>", ":w <CR>", opt)
    key("i", "<M-w>", "<c-\\><c-n>:w <CR>", opt)

	key("n", "<M-q>", ":bd! <CR>", opt)
	key("n", "<M-c>", ":bd<CR>", opt)

	key("n", "<M-1>", ":BufferLineGoToBuffer 1<CR>", opt)
	key("n", "<M-2>", ":BufferLineGoToBuffer 2<CR>", opt)
	key("n", "<M-3>", ":BufferLineGoToBuffer 3<CR>", opt)
	key("n", "<M-4>", ":BufferLineGoToBuffer 4<CR>", opt)
	key("n", "<M-5>", ":BufferLineGoToBuffer 5<CR>", opt)
	key("n", "<M-6>", ":BufferLineGoToBuffer 6<CR>", opt)
	key("n", "<M-7>", ":BufferLineGoToBuffer 7<CR>", opt)
	key("n", "<M-8>", ":BufferLineGoToBuffer 8<CR>", opt)
	key("n", "<M-9>", ":BufferLineGoToBuffer 9<CR>", opt)
	key("n", "<M-0>", ":BufferLineGoToBuffer 0<CR>", opt)

    key("n", "<M-[>", ":BufferLineCyclePrev<CR>", opt)
    key("n", "<M-]>", ":BufferLineCycleNext<CR>", opt)

	key("n", "<M-f>", "<cmd>FZF<CR>", opt)
	key("n", "<M-s>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opt)
	key("n", "<M-b>", "<cmd>Telescope buffers<CR>", opt)
	key("n", "<M-t>", ":Telescope colorscheme<CR>", opt)

	key("n", "<M-h>", "<C-w>h", opt)
	key("n", "<M-j>", "<C-w>j", opt)
	key("n", "<M-k>", "<C-w>k", opt)
	key("n", "<M-l>", "<C-w>l", opt)

    key("n", "<M-_>", ":sp<CR>", opt)
	key("n", "<M-|>", ":vs<CR>", opt)

	key("n", "<M-d>", ":Trouble<CR>", opt)
	key("n", "<M-z>", ":ZenMode<CR>", opt)

	key("n", "<M-r>", "<cmd>lua Rename.rename()<CR>", opt)
	key("n", "<M-a>", ":Telescope lsp_code_actions<CR>", opt)

	key("n", "<M-u>", ":DBUIToggle<CR>", opt)
	key("n", "<M-Tab>", ":Spotify next<CR>", opt)
	key("n", "<M-LeftMouse>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opt)

    key("n", "<M-o>", ":SymbolsOutline<CR>", opt)

    key("n", "<M-/>", "<Plug>kommentary_line_default", opt)
    key("v", "<M-/>", "<Plug>kommentary_visual_default<C-c>", opt)
end

key("n", "<Leader>du", ":DBUIToggle<CR>", opt)
return key
