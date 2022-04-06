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


-- Rename stuff
local function dorename(win)
	local new_name = vim.trim(vim.fn.getline("."))
	vim.api.nvim_win_close(win, true)
	vim.lsp.buf.rename(new_name)
end

local function rename()
	local opts = {
		relative = "cursor",
		row = 0,
		col = 0,
		width = 30,
		height = 1,
		style = "minimal",
		border = "single",
	}
	local cword = vim.fn.expand("<cword>")
	local buf = vim.api.nvim_create_buf(false, true)
	local win = vim.api.nvim_open_win(buf, true, opts)
	local fmt = "<cmd>lua Rename.dorename(%d)<CR>"

	vim.api.nvim_buf_set_lines(buf, 0, -1, false, { cword })
	vim.api.nvim_buf_set_keymap(buf, "i", "<CR>", string.format(fmt, win), { silent = true })
end

_G.Rename = {
	rename = rename,
	dorename = dorename,
}

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
key("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opt)
key("n", "K", ":lua vim.lsp.buf.hover()<CR>", opt)
key("n", "gs", ":lua vim.lsp.buf.signature_help()<CR>", opt)
key("n", "gr", ":lua vim.lsp.buf.references()<CR>", opt)
key("n", "<Leader>wa", ":lua vim.lsp.buf.add_workLeader_folder()<CR>", opt)
key("n", "<Leader>wr", ":lua vim.lsp.buf.remove_workLeader_folder()<CR>", opt)
key("n", "<Leader>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workLeader_folders()))<CR>", opt)
key("n", "<Leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opt)
key("n", "<Leader>D", ":lua vim.lsp.buf.type_definition()<CR>", opt)
key("n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opt)
key("n", "<Leader>rn", ":lua Rename.rename()<CR>", opt)
key("n", "<Leader>ee", ":lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opt)
key("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", opt)
key("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", opt)
key("n", "<Leader>c", ":lua vim.lsp.diagnostic.set_loclist()<CR>", opt)
key("n", "<Leader>ld", ":lua vim.lsp.util.show_line_diagnostics()<CR>", opt)
key("n", "ff", ":lua vim.lsp.buf.formatting()<CR>", opt)

-- Switch screen
key("n", "<Leader>wh", "<C-w>h", opt)
key("n", "<Leader>wj", "<C-w>j", opt)
key("n", "<Leader>wk", "<C-w>k", opt)
key("n", "<Leader>wl", "<C-w>l", opt)

-- Resize
key("n", "<C-k>", ":res +5<CR>", opt)
key("n", "<C-j>", ":res -5<CR>", opt)
key("n", "<S-l>", ":vertical res +5<CR>", opt)
key("n", "<S-h>", ":vertical res -5<CR>", opt)

-- Indent
key("v", "J", ":m '>+1<CR>gv=gv", opt)
key("v", "K", ":m '<-2<CR>gv=gv", opt)
key("v", "L", ">gv", opt)
key("v", "H", "<gv", opt)

-- Split
key("n", "<Leader>|", ":vs<CR>", opt)
key("n", "<Leader>_", ":sp<CR>", opt)

-- Outline
key("n", "<Leader>o", ":SymbolsOutline<CR>", opt)

-- Kill buffer
key("n", "<C-c>", ":bd<CR>", opt)

-- Nvim Tree
key("n", "<F1>", ":NvimTreeToggle<CR>", opt)

-- Highlight
key("n", "<Leader>z", "<cmd>nohlsearch<CR>", opt)

-- Telescope
key("n", "<Leader>ff", ":FZF<CR>", opt)
key("n", "<Leader>fe", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opt)
key("n", "<Leader>:", "<cmd>Telescope commands<CR>", opt)
key("n", "<Leader>bb", "<cmd>Telescope buffers<CR>", opt)
key("n", "<Leader>gb", "<cmd>Telescope git_branches<CR>", opt)
key("n", "<Leader>cc", "<cmd>Telescope git_commits<CR>", opt)
key("n", "<Leader>ss", ":Telescope sessions<CR>", opt)
key("n", "<Leader>fm", ":Telescope file_browser<CR>", opt)

-- Using ; to Command mode
key("n", ";", ":", opt)

-- Quit and Save
key("n", "<Leader>sw", ":SudaWrite<CR>", opt)
key("n", "<Leader>q", ":q<CR>", opt)
key("n", "<Leader>qq", ":q!<CR>", opt)
key("n", "<Leader>w", ":w<CR> <cmd>lua vim.lsp.buf.formatting()<CR>", opt)

-- Dashboard shortcut
key("n", "<Leader>fo", "<cmd>Telescope oldfiles<CR>", opt)
key("n", "<Leader>fw", "<cmd>Telescope live_grep<CR>", opt)
key("n", "<Leader>fn", ":DashboardNewFile<CR>", opt)
key("n", "<Leader>bm", "<cmd>Telescope marks<CR>", opt)
key("n", "<Leader>so", "<cmd>SessionLoad<CR>", opt)

-- Packer related stuff
key("n", "<Leader>pi", ":PackerInstall<CR>", opt)
key("n", "<Leader>ps", ":PackerSync<CR>", opt)

-- Update Discord Rich Presence
key("n", "<Leader>td", ":lua package.loaded.presence:update()<CR>", opt)

-- Terminal on bellow the screen
key("n", "<C-x>", ":20new +terminal | setlocal nobuflisted <CR>", opt) --  term bottom
key("n", "<Leader>x", ":execute 'vnew +terminal' | let b:term_type = 'vert' | startinsert <CR>", opt)

-- Using jk as ESC
key("t", "jk", "<C-\\><C-n>", opt)
key("i", "jk", "<esc>", opt)

-- Terminal
key("i", "<F2>", "<Esc>:FloatermToggle<CR>", opt)
key("n", "<F2>", "<C-\\><C-n>:FloatermToggle<CR>", opt)
key("t", "<F2>", "<C-\\><C-n>:FloatermToggle<CR>", opt)

-- Zen mode
key("n", "<Leader>zz", ":ZenMode<CR>", opt)

-- Buffer switch
key("n", "<Leader>[", ":BufferLineCyclePrev<CR>", opt)
key("n", "<Leader>]", ":BufferLineCycleNext<CR>", opt)

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
key("n", "<Leader>tn", ":enew<CR>", opt)

-- Hop word
key("n", "e", ":HopWord<CR>", opt)
key("x", "e", ":HopLineStartAC<CR>", opt)

-- Carbon Now Sha
key("v", "<F5>", ":CarbonNowSh<CR>", opt)

-- Restart lsp
key("n", "<Leader>rr", ":LspRestart<CR>", opt)

-- Trouble
key("n", "<Leader>tr", ":Trouble<CR>", opt)

-- map keybind to cd current file directory
key("n", "<Leader>cd", ":cd %:h<CR>", opt)

-- Unit testing
key("n", "<Leader>m", ":lua require('dap-go').debug_test()<CR>", opt)
key("n", "<C-m>", ":UltestNearest<CR>", opt)
key("n", "<C-p>", ":UltestSummary<CR>", opt)

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

key("n", "<Leader>lL", ":set relativenumber<CR>", opt)
key("n", "<Leader>ll", ":set norelativenumber<CR>", opt)

key("n", "<Leader>du", ":DBUIToggle<CR>", opt)
return key
