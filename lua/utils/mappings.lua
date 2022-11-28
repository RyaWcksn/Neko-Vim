local module = require("utils.nekorc")

vim.g.mapleader = module.leader

local opt = { silent = true, noremap = true }
local key = vim.api.nvim_set_keymap

M = {}

M.Mapping = {
    [";"] = { ":", "Command" },
    ["jk"] = { "<C-\\><C-n>", "Normal mode" },
    w = {
        name = "+Window",
        k = { "<c-w>k", "Switch Up" },
        j = { "<c-w>j", "Switch Down" },
        h = { "<c-w>h", "Switch Leff" },
        l = { "<c-w>l", "Switch Right" },
        K = { ":res +5<CR>", "Resize Up" },
        J = { ":res -5<CR>", "Resize Down" },
        H = { ":vertical res -5<CR>", "Resize Left" },
        L = { ":vertical res +5<CR>", "Resize Right" },
        ["<Leader>"] = {
            name = "+Split",
            k = { ":vs<CR>", "Split Vertically" },
            j = { ":sp<CR>", "Split Horizontally" },
        },
    },
    f = {
        name = "+Finds",
        f = { ":Telescope find_files theme=dropdown<CR>", "Find Files" },
        w = { ":Telescope live_grep<CR>", "Find Words" },
        g = { ":Telescope git_status<CR>", "Find Commits" },
        b = { ":lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({}))<CR>", "Find Buffers" },
        h = { ":Telescope help_tags<CR>", "Find Helps" },
    },
    p = {
        name = "+Packer",
        s = { ":PackerSync<CR>", "Sync plugins" },
        i = { ":PackerInstall<CR>", "Install plugins" }
    },
    s = {
        name = "+Save",
        w = { ":w<CR>", "Save" },
        s = { ":SudaWrite<CR>", "Sudo save" },
    },
    d = {
        name = "+Debug",
        u = { ':lua require("dapui").open()<CR>', "Toggle DAP Ui" },
        c = { ':lua require("dap").continue()<CR>', "DAP Continue" },
        v = { ':lua require("dap").step_over()<CR>', "DAP Step Over" },
        i = { ':lua require("dap").step_into()<CR>', "DAP Step Into" },
        a = { ':lua require("dap").step_out()<CR>', "DAP Step Out" },
        R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
        E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
        s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
        x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
        r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
        d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
        h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },

    },
    b = {
        name = "+Buffer",
        t = { ":enew<CR>", "New Buffer" },
        x = { ":bd!<CR>", "Delete Buffer" },
        d = { "::%bd|e#<CR>", "Delete all except this Buffer" },
    },
    l = {
        name = "+LSP",
        f = { ":lua vim.lsp.buf.format()<CR>", "Code Format" },
        c = { ":lua vim.lsp.buf.code_action()<CR>", "Code Action" },
        s = { ":lua vim.lsp.buf.signature_help()<CR>", "Code Signature" },
        d = { ":lua vim.lsp.buf.definition()<CR>", "Code Definition" },
        D = { ":lua vim.lsp.buf.declaration()<CR>", "Code Declaration" },
        i = { ":lua vim.lsp.buf.implementation()<CR>", "Code Implementation" },
        k = { ":lua vim.lsp.buf.hover()<CR>", "Code Hover" },
        w = { ":lua vim.lsp.buf.references()<CR>", "Code References" },
        l = { ":lua vim.lsp.codelens.run()<CR>", "Code Lens" },
        r = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
        t = { ":Telescope diagnostics<CR>", "Error Diagnostics" },
    },
    o = {
        name = "+Open",
        d = { ":cd %:h<CR>", "Change Directory" },
        s = { ":SymbolsOutline<CR>", "Symbols Outline" },
        e = { ":NvimTreeToggle<CR>", "File Tree" },
        n = {
            name = "+Line number",
            n = { ":set norelativenumber<CR>", "Disable relative numbers" },
            r = { ":set relativenumber<CR>", "Enable relative numbers" },
        },
        w = { ":lua OpenLink()<CR>", "Open Url" },
        a = { "zR", "Open All Fold" },
        t = {
            name = "+Terminal",
            j = { ':lua OpenTerminal("horizontal")<CR>', "Open Horizontal" },
            l = { ':lua OpenTerminal("vertical")<CR>', "Open Vertical" },
            k = { ':lua OpenTerminal("tab")<CR>', "Open Tab" },
            h = { ':lua OpenTerminal("float")<CR>', "Open Float" },
        }
    },
    e = {
        name = "+Essentials",
        d = {
            name = "+Discord",
            s = { ":lua package.loaded.presence:cancel()<CR>", "Stop Discord" },
            d = { ":lua package.loaded.presence:update()<CR>", "Start Discord" },
        },
        z = { ":ZenMode<CR>", "Zen Mode" },
    },
    g = {
        name = "+Git",
        l = { ":Telescope git_stash<CR>", "List All Stash" },
        s = { ":lua require('gitsigns').stage_hunk()<CR>", "Stage Hunk" },
        S = { ":lua require('gitsigns').stage_buffer()<CR>", "Stage Buffer" },
        u = { ":lua require('gitsigns').undo_stage_hunk()<CR>", "Unstage Hunk" },
        r = { ":lua require('gitsigns').reset_hunk()<CR>", "Reset Hunk" },
        R = { ":lua require('gitsigns').reset_buffer()<CR>", "Reset Buffer" },
        U = { ":lua require('gitsigns').reset_buffer_index()<CR>", "Reset Buffer" },
        p = { ":lua require('gitsigns').preview_hunk()<CR>", "Preview Hunk" },
        b = { ":lua require('gitsigns').blame_line(true)<CR>", "Blame Line" },
    },
    c = {
        name = "+Code",
        r = { ":lua RunProgram()<CR>", "Run Program" }
    },
    ["Y"] = { "y$", "Yank from this line" },
    ["J"] = { "mzJ`z", "Move line below to this line" },
    ["n"] = { "nzzzv", "Search next" },
    ["N"] = { "Nzzzv", "Search prev" },
    ["/"] = { name = "Comment" },
}

M.Vmapping = {
    ["/"] = { name = "Comment" },
    ["J"] = { ":m '>+1<CR>gv=gv", "Move Down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move Up" },
    ["L"] = { ">gv", "Move Right" },
    ["H"] = { "<gv", "Move Left" },
    g = {
        name = "+Git",
        s = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
        r = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
        i = { ":<C-U>lua require('gitsigns.actions').select_hunk()<CR>", "Select Hunk" },
    }
}

-- Using jk as ESC
key("t", "jk", "<C-\\><C-n>", opt)
key("i", "jk", "<esc>", opt)

return M
