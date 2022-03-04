local opt = {noremap = true, silent = true}
vim.g.mapleader = " "
local key = vim.api.nvim_set_keymap
-- Disable key
vim.cmd[[
noremap . <NOP>
]]

-- Rename stuff
local function dorename(win)
  local new_name = vim.trim(vim.fn.getline('.'))
  vim.api.nvim_win_close(win, true)
  vim.lsp.buf.rename(new_name)
end

local function rename()
  local opts = {
    relative = 'cursor',
    row = 0,
    col = 0,
    width = 30,
    height = 1,
    style = 'minimal',
    border = 'single'
  }
  local cword = vim.fn.expand('<cword>')
  local buf = vim.api.nvim_create_buf(false, true)
  local win = vim.api.nvim_open_win(buf, true, opts)
  local fmt =  '<cmd>lua Rename.dorename(%d)<CR>'

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {cword})
  vim.api.nvim_buf_set_keymap(buf, 'i', '<CR>', string.format(fmt, win), {silent=true})
end

_G.Rename = {
   rename = rename,
   dorename = dorename
}

-- Stuff
key("n", "Y","y$", opt)
key("n", "J", "mzJ`z", opt)
key("n", "n", "nzzzv", opt)
key("n", "N", "Nzzzv", opt)
key("v", "J", ":m '>+1<CR>gv=gv", opt)
key("v", "K", ":m '<-2<CR>gv=gv", opt)
key("v", "L", ">gv", opt)
key("v", "H", "<gv", opt)
key("n", "j", "gj", opt)
key("n", "k", "gk", opt)
key("n", "<C-L>", "zL", opt)
key("n", "<C-H>", "zH", opt)

-- LSP
key("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opt)
key("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opt)
key("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opt)
key("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
key("n","gs","<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
key("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
key("n","gr",":Telescope lsp_references<CR>", opt)
key("n", "<Leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opt)
key("n", "<Leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opt)
key("n", "<Leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opt)
key("n", "<space>ca", ":Telescope lsp_code_actions<CR>", opt)
key("n", "<Leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opt)
key("n","gi","<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
key("n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
key("n", "<Leader>ee", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opt)
key("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opt)
key("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opt)
key("n", "<space>c", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opt)
key("n","<leader>ld","<cmd>lua vim.lsp.util.show_line_diagnostics()<CR>", opt)
key("n", "ff", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)

-- Switch screen
key('n', '<Leader>h', '<C-w>h', opt)
key('n', '<Leader>j', '<C-w>j', opt)
key('n', '<Leader>k', '<C-w>k', opt)
key('n', '<Leader>l', '<C-w>l', opt)

-- Split
key('n', '<Leader>v', ':vs<CR>', opt)
key('n', '<Leader>b', ':sp<CR>', opt)

-- Kill buffer
key('n', '<C-c>', ':bd<CR>', opt)

-- Nvim Tree
key('n', '<Leader>e', ':NvimTreeToggle<CR>', opt)

-- Highlight
key('n', '<Leader>z', '<cmd>nohlsearch<CR>', opt)

-- Telescope
key("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opt)
key("n", "<leader>fe", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opt)
key("n", "<leader>:", "<cmd>Telescope commands<CR>", opt)
key("n", "<leader>bb", "<cmd>Telescope buffers<CR>", opt)
key("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", opt)
key("n", "<leader>cc", "<cmd>Telescope git_commits<CR>", opt)
key("n", "<leader>ss", ":Telescope sessions<CR>", opt)
key("n", "<leader>tt", ":Telescope colorscheme<CR>", opt)
key("n", "<leader>fm", ":Telescope file_browser<CR>", opt)

-- Using ; to Command mode
key("n", ";", ":", opt)

-- Quit and Save
key('n', '<Leader>w', ':w<CR>', opt)
key('n', '<Leader>sw', ':SudaWrite<CR>', opt)
key('n', '<Leader>q', ':q<CR>', opt)
key('n', '<Leader>qq', ':q!<CR>', opt)

-- Dashboard shortcut
key("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", opt)
key("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", opt)
key("n", "<leader>fn", ":DashboardNewFile<CR>", opt)
key("n", "<leader>bm", "<cmd>Telescope marks<CR>", opt)
key("n", "<leader>so", "<cmd>SessionLoad<CR>", opt)

-- Packer related stuff
key("n", "<leader>pi", ":PackerInstall<CR>", opt)
key("n", "<leader>ps", ":PackerSync<CR>", opt)

-- Update Discord Rich Presence
key("n", "<leader>td", ":lua package.loaded.presence:update()<CR>", opt)

-- Terminal on bellow the screen
key("n", "<C-x>", ":20new +terminal | setlocal nobuflisted <CR>", opt) --  term bottom
key("n", "<Leader>x", ":execute 'vnew +terminal' | let b:term_type = 'vert' | startinsert <CR>", opt)

-- Using jk as ESC
key("t", "jk", "<C-\\><C-n>", opt)
key('i', 'jk', '<esc>', opt)

-- Terminal
key("i", "<F2>", "<Esc>:FloatermToggle<CR>", opt)
key("n", "<F2>", "<C-\\><C-n>:FloatermToggle<CR>", opt)
key("t", "<F2>", "<C-\\><C-n>:FloatermToggle<CR>", opt)

-- Floating terminal
key("n", "<F3>", "<c-\\><c-n>:FloatermUpdate --width=0.8 --height=0.8<CR>", opt)
key("n", "<F4>", "<c-\\><c-n>:FloatermUpdate --width=1.0 --height=1.0<CR>", opt)

-- Zen mode
key("n", "<leader>zz", ":ZenMode<CR>", opt)

-- Using Alt and Movement key for moving line
-- map("n", "<Leader>h", "<<", opt)
-- map("n", "<Leader>j", "<ESC>:m. +1<CR>", opt)
-- map("n", "<Leader>k", "<ESC>:m. -2<CR>", opt)
-- map("n", "<Leader>l", ">>", opt)

-- Buffer switch
key('n', '<Leader>[', ':BufferLineCyclePrev<CR>', opt)
key('n', '<Leader>]', ':BufferLineCycleNext<CR>', opt)

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
key("n", "<leader>tn", ":enew<CR>", opt)

-- Indent line
key("n", "<leader>ii", ":IndentBlanklineEnable<CR>", opt)
key("n", "<leader>iI", ":IndentBlanklineDisable<CR>", opt)

-- Gitsigns
key("n", "<leader>m", ":Gitsigns toggle_current_line_blame<cr>", opt)
key("n", "<leader>hh", ":Gitsigns preview_hunk<cr>", opt)

-- NekoRc
key("n", "<Leader>en", ":e ~/.config/nvim/lua/nekorc.lua<CR>", opt)

-- Tab in markdown
key("n", "<Leader>tm", ":VimwikiTable", opt)

-- LazyGit
key("n", "<Leader>gg", ":LazyGit<CR>", opt)

key("n", "e", ":HopWord<CR>", opt)

-- map("n", "<C-l>", ":vertical resize +5<CR>", opt)
-- -- Resize
-- map("n", "<C-h>", ":vertical resize -5<CR>", opt)
-- map("n", "<C-k>", ":res -5<CR>", opt)
-- map("n", "<C-j>", ":res +5<CR>", opt)

key("n", "<F7>", ":Spotify previous<CR>", opt)
key("n", "<F9>", ":Spotify next<CR>", opt)
key("n", "<F8>", ":Spotify play/pause<CR>", opt)

-- Carbon Now Sha
key("v", "<F5>", ":CarbonNowSh<CR>", opt)

-- ranger
key('n', '<leader>rr', ':RnvimrToggle<CR>',opt)

-- Trouble
key('n', '<leader>tr', ":Trouble<CR>", opt)

-- Resize
key("n", "<C-k>", ":res +5<CR>", opt)
key("n", "<C-j>", ":res -5<CR>", opt)
key("n", "<S-l>", ":vertical res +5<CR>", opt)
key("n", "<S-h>", ":vertical res -5<CR>", opt)
-- map keybind to cd current file directory
key("n", "<leader>cd", ":cd %:h<CR>", opt)

-- Save
if vim.fn.has("mac") == 1 then
    key('n', "<D-s>", ":w <CR>", opt)
    key('i', "<D-s>", "<c-\\><c-n>:w <CR>", opt)
    key("n", "<D-1>", ":BufferLineGoToBuffer 1<CR>", opt)
    key("n", "<D-2>", ":BufferLineGoToBuffer 2<CR>", opt)
    key("n", "<D-3>", ":BufferLineGoToBuffer 3<CR>", opt)
    key("n", "<D-4>", ":BufferLineGoToBuffer 4<CR>", opt)
    key("n", "<D-5>", ":BufferLineGoToBuffer 5<CR>", opt)
    key("n", "<D-6>", ":BufferLineGoToBuffer 6<CR>", opt)
    key("n", "<D-7>", ":BufferLineGoToBuffer 7<CR>", opt)
    key("n", "<D-8>", ":BufferLineGoToBuffer 8<CR>", opt)
    key("n", "<D-9>", ":BufferLineGoToBuffer 9<CR>", opt)
    key("n", "<D-0>", ":BufferLineGoToBuffer 0<CR>", opt)
    key('n', '<D-e>', ':NvimTreeToggle<CR>', opt)

    key("n", "<D-f>", "<cmd>Telescope find_files<CR>", opt)
    key("n", "<D-w>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opt)
    key("n", "<D-b>", "<cmd>Telescope buffers<CR>", opt)
    key("n", "<leader>cc", "<cmd>Telescope git_commits<CR>", opt)
    key("n", "<D-t>", ":Telescope colorscheme<CR>", opt)
    key("n", "<D-m>", ":Telescope file_browser<CR>", opt)

    key('n', '<D-h>', '<C-w>h', opt)
    key('n', '<D-j>', '<C-w>j', opt)
    key('n', '<D-k>', '<C-w>k', opt)
    key('n', '<D-l>', '<C-w>l', opt)

    key('n', '<D-[>', ':BufferLineCyclePrev<CR>', opt)
    key('n', '<D-]>', ':BufferLineCycleNext<CR>', opt)

    key('n', '<D-v>', ':vs<CR>', opt)
    key('n', '<D-b>', ':sp<CR>', opt)

    key("n", "<D-r>", "<cmd>lua Rename.rename()<CR>", opt)
    key("n", "<D-=>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opt)
    key("n", "<D-a>", ":Telescope lsp_code_actions<CR>", opt)
    key("n", "<D-g>", ":LazyGit<CR>", opt)
elseif vim.fn.has("unix") then
    key('n', "<M-w>", ":w <CR>", opt)
    key('n', "<M-q>", ":bd! <CR>", opt)
    key('n', '<M-c>', ':bd<CR>', opt)
    key('i', "<M-w>", "<c-\\><c-n>:w <CR>", opt)
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
    key('n', '<M-e>', ':NvimTreeToggle<CR>', opt)

    key("n", "<M-f>", "<cmd>FZF<CR>", opt)
    key("n", "<M-s>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", opt)
    key("n", "<M-b>", "<cmd>Telescope buffers<CR>", opt)
    key("n", "<M-t>", ":Telescope colorscheme<CR>", opt)
    key("n", "<M-m>", ":Telescope file_browser<CR>", opt)

    key('n', '<M-h>', '<C-w>h', opt)
    key('n', '<M-j>', '<C-w>j', opt)
    key('n', '<M-k>', '<C-w>k', opt)
    key('n', '<M-l>', '<C-w>l', opt)

    key('n', '<M-[>', ':BufferLineCyclePrev<CR>', opt)
    key('n', '<M-]>', ':BufferLineCycleNext<CR>', opt)

    key('n', '<M-v>', ':vs<CR>', opt)
    key('n', '<M-b>', ':sp<CR>', opt)

    key('n', '<M-d>', ":Trouble<CR>", opt)
    key("n", "<M-z>", ":ZenMode<CR>", opt)

    key("n", "<M-r>", "<cmd>lua Rename.rename()<CR>", opt)
    key("n", "<M-=>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opt)
    key("n", "<M-a>", ":Telescope lsp_code_actions<CR>", opt)
    key("n", "<M-g>", ":LazyGit<CR>", opt)
    key("n", "<M-p>", ":Telescope telescope_project<CR>", opt)

    key('n', '<M-u>', ":DBUIToggle<CR>", opt)
    key("n", "<M-Tab>", ":Spotify next<CR>", opt)
    key("n", "<M-LeftMouse>", "<Cmd>lua vim.lsp.buf.definition()<CR>", opt)
end
key('n', '<leader>lL', ":set relativenumber<CR>", opt)
key('n', '<leader>ll', ":set norelativenumber<CR>", opt)

key('n', '<leader>du', ":DBUIToggle<CR>", opt)
return key
