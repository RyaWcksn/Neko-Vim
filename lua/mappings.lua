local opt = {noremap = true, silent = true}
vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap

-- LSP
map("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opt)
map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opt)
map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opt)
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
map('n','gs','<cmd>lua vim.lsp.buf.signature_help()<CR>', opt)
map("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
map('n','gr','<cmd>lua vim.lsp.buf.references()<CR>', opt)
map("n", "<Leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opt)
map("n", "<Leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opt)
map("n", "<Leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opt)
map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opt)
map("n", "<Leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opt)
map('n','gi','<cmd>lua vim.lsp.buf.implementation()<CR>', opt)
map("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
map("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opt)
map("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opt)
map("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opt)
map("n", "<space>c", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opt)
map('n','<leader>ld','<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>', opt)
map("n", "ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)

-- Switch screen
map('n', '<Leader>h', '<C-w>h', opt)
map('n', '<Leader>j', '<C-w>j', opt)
map('n', '<Leader>k', '<C-w>k', opt)
map('n', '<Leader>l', '<C-w>l', opt)

-- Split
map('n', '<Leader>v', ':vs<CR>', opt)
map('n', '<Leader>b', ':sp<CR>', opt)

-- Kill buffer
map('n', '<C-c>', ':bd<CR>', opt)

-- Nvim Tree
map('n', '<Leader>e', ':NvimTreeToggle<CR>', opt)

-- Highlight
map('n', '<Leader>z', '<cmd>nohlsearch<CR>', opt)

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opt)
map("n", "<leader>fe", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opt)
map("n", "<leader>:", "<cmd>Telescope commands<CR>", opt)
map("n", "<leader>bb", "<cmd>Telescope buffers<CR>", opt)
map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", opt)
map("n", "<leader>cc", "<cmd>Telescope git_commits<CR>", opt)
map("n", "<leader>ss", ":Telescope sessions<CR>", opt)
map("n", "<leader>tt", ":Telescope colorscheme<CR>", opt)

-- Using ; to Command mode
map("n", ";", ":", opt)

-- Quit and Save
map('n', '<Leader>w', ':w<CR>', opt)
map('n', '<Leader>sw', ':SudaWrite<CR>', opt)
map('n', '<Leader>q', ':q<CR>', opt)
map('n', '<Leader>qq', ':q!<CR>', opt)

-- Dashboard shortcut
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opt)
map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", opt)
map("n", "<leader>fn", ":DashboardNewFile<CR>", opt)
map("n", "<leader>bm", "<cmd>Telescope marks<CR>", opt)
map("n", "<leader>so", "<cmd>SessionLoad<CR>", opt)

-- Packer related stuff
map("n", "<leader>pi", ":PackerInstall<CR>", opt)
map("n", "<leader>ps", ":PackerSync<CR>", opt)

-- Update Discord Rich Presence 
map("n", "<leader>td", ":lua package.loaded.presence:update()<CR>", opt)

-- Terminal on bellow the screen
map("n", "<C-x>", ":10new +terminal | setlocal nobuflisted <CR>", opt) --  term bottom
map("n", "<Leader>x", ":execute 'vnew +terminal' | let b:term_type = 'vert' | startinsert <CR>", opt)

-- Using jk as ESC
map("t", "jk", "<C-\\><C-n>", opt)
map('i', 'jk', '<esc>', opt)

-- Terminal
map("i", "<F2>", "<Esc>:FloatermToggle<CR>", opt)
map("n", "<F2>", "<C-\\><C-n>:FloatermToggle<CR>", opt)

-- Floating terminal
map("n", "tZ", ":FloatermUpdate --width=0.8 --height=0.8<CR>", opt)
map("n", "tz", ":FloatermUpdate --width=1.0 --height=1.0<CR>", opt)

-- Zen mode
map("n", "<leader>zz", ":ZenMode<CR>", opt)

-- Using Alt and Movement key for moving line
-- map("n", "<Leader>h", "<<", opt)
-- map("n", "<Leader>j", "<ESC>:m. +1<CR>", opt)
-- map("n", "<Leader>k", "<ESC>:m. -2<CR>", opt)
-- map("n", "<Leader>l", ">>", opt)

-- Buffer switch
map('n', '<Leader>[', ':BufferLineCyclePrev<CR>', opt)
map('n', '<Leader>]', ':BufferLineCycleNext<CR>', opt)

-- Buffer tabbing
map("n", "<Leader>1", ":BufferLineGoToBuffer 1<CR>", opt)
map("n", "<Leader>2", ":BufferLineGoToBuffer 2<CR>", opt)
map("n", "<Leader>3", ":BufferLineGoToBuffer 3<CR>", opt)
map("n", "<Leader>4", ":BufferLineGoToBuffer 4<CR>", opt)
map("n", "<Leader>5", ":BufferLineGoToBuffer 5<CR>", opt)
map("n", "<Leader>6", ":BufferLineGoToBuffer 6<CR>", opt)
map("n", "<Leader>7", ":BufferLineGoToBuffer 7<CR>", opt)
map("n", "<Leader>8", ":BufferLineGoToBuffer 8<CR>", opt)
map("n", "<Leader>9", ":BufferLineGoToBuffer 9<CR>", opt)
map("n", "<Leader>0", ":BufferLineGoToBuffer 0<CR>", opt)
map("n", "<leader>tn", ":enew<CR>", opt)

-- Indent line
map("n", "<leader>ii", ":IndentBlanklineEnable<CR>", opt)
map("n", "<leader>iI", ":IndentBlanklineDisable<CR>", opt)

-- Gitsigns
map("n", "<Leader>m", ":Gitsigns toggle_current_line_blame<CR>", opt)

-- NekoRc
map("n", "<Leader>en", ":e ~/.config/nvim/lua/nekorc.lua<CR>", opt)

-- Tab in markdown
map("n", "<Leader>tm", ":VimwikiTable", opt)

-- LazyGit
map("n", "<Leader>gg", ":LazyGit<CR>", opt)

map("n", "e", ":HopWord<CR>", opt)

map("n", "<C-l>", ":vertical resize +5<CR>", opt)
-- Resize
map("n", "<C-h>", ":vertical resize -5<CR>", opt)
map("n", "<C-k>", ":res -5<CR>", opt)
map("n", "<C-j>", ":res +5<CR>", opt)

-- ranger
map('n', '<leader>rr', ':RnvimrToggle<CR>',opt)
vim.g.onedark_toggle_style_keymap = '<Leader>tc'

return map
