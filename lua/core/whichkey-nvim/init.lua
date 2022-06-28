local ok, wk = pcall(require, "which-key")
if not ok then
    print("which-key not found, please install it.")
    os.exit(1)
end

-- Rename stuff
local function dorename(win)
    local new_name = vim.trim(vim.fn.getline("."))
    vim.api.nvim_win_close(win, true)
    vim.lsp.buf.rename(new_name)
end

-- Golang Mock
function GolangMock()
    local file = vim.fn.expand("%")
    local output = file:match "(.+)%..+$" .. "_mock.go"
    local source = file:match "^.+/(.+)$"
    local package = vim.fn.input("Package name: ")
    local cmd = { "mockgen", "-source", file, "-destination", output, "-package", package }
    os.execute(table.concat(cmd, " "))
    print(", Mock file generated: " .. output .. " Package: " .. package)
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

function OpenLink()
    if vim.fn.has("macunix") == 1 then
        vim.api.nvim_command("silent execute '!open ' . shellescape('<cWORD>')")
    else
        vim.api.nvim_command("silent execute '!xdg-open ' . shellescape(expand('<cfile>'), 1)")
    end
end

_G.Rename = {
    rename = rename,
    dorename = dorename,
}

wk.setup {
    {
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            presets = {
                operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = true, -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <c-w>
                nav = true, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
        },
        -- add operators that will trigger motion and text object completion
        -- to enable all native operators, set the preset / operators plugin above
        operators = { gc = "Comments" },
        key_labels = {
            ["<space>"] = "SPC",
            ["<cr>"] = "RET",
            ["<tab>"] = "TAB",
            ["<A>"] = "META"
        },
        icons = {
            breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
            separator = "➜", -- symbol used between a key and it's label
            group = "+", -- symbol prepended to a group
        },
        popup_mappings = {
            scroll_down = '<c-d>', -- binding to scroll down inside the popup
            scroll_up = '<c-u>', -- binding to scroll up inside the popup
        },
        window = {
            border = "single", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
            padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
            winblend = 0
        },
        layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 10, -- spacing between columns
            align = "left", -- align columns left, center or right
        },
        ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
        hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
        show_help = true, -- show help message on the command line when the popup is visible
        triggers = "auto", -- automatically setup triggers
        triggers_blacklist = {
            i = { "j", "k" },
            v = { "j", "k" },
        },
    },

    wk.register({
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
                k = { ":vs<CR>", "Split Vertically" },
                j = { ":sp<CR>", "Split Horizontally" },
            },
            ["1"] = { ":BufferLineGoToBuffer 1<CR>", "Buffer 1" },
            ["2"] = { ":BufferLineGoToBuffer 2<CR>", "Buffer 2" },
            ["3"] = { ":BufferLineGoToBuffer 3<CR>", "Buffer 3" },
            ["4"] = { ":BufferLineGoToBuffer 4<CR>", "Buffer 4" },
            ["5"] = { ":BufferLineGoToBuffer 5<CR>", "Buffer 5" },
            ["6"] = { ":BufferLineGoToBuffer 6<CR>", "Buffer 6" },
            ["7"] = { ":BufferLineGoToBuffer 7<CR>", "Buffer 7" },
            ["8"] = { ":BufferLineGoToBuffer 8<CR>", "Buffer 8" },
            ["9"] = { ":BufferLineGoToBuffer 9<CR>", "Buffer 9" },
        },
        f = {
            name = "+Finds",
            f = { ":Telescope find_files follow=true no_ignore=true hidden=true<CR>", "Find Files" },
            w = { ":Telescope live_grep<CR>", "Find Words" },
            g = { ":Telescope git_commit<CR>", "Find Commits" },
            b = { ":Telescope buffers<CR>", "Find Buffers" },
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
            name = "+Discord",
            s = { ":lua package.loaded.presence:cancel()<CR>", "Stop Discord" },
            d = { ":lua package.loaded.presence:update()<CR>", "Start Discord" },
        },
        b = {
            name = "+Buffer",
            t = { ":enew<CR>", "New Buffer" },
        },
        u = {
            name = "+Unit testing",
            w = { ":TestNearest<CR>", "Test Function" },
            s = { ":TestFile<CR>", "Test File" },
            a = { ":TestSuite<CR>", "Test All" }
        },
        l = {
            name = "+LSP",
            f = { ":lua vim.lsp.buf.formatting()<CR>", "Format" },
            c = { ":lua vim.lsp.buf.code_action()<CR>", "Code Action" },
            r = { ":lua Rename.rename()<CR>", "Rename" },
            a = { ":lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic" },
            d = { ":lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
            w = { ":lua vim.lsp.buf.references()<CR>", "References" },
            t = { ":Trouble<CR>", "Errors" }

        },
        ["/"] = {
            name = "Comment"
        },
        o = {
            name = "+Open",
            d = { ":cd %:h<CR>", "Change Directory" },
            s = { ":SymbolsOutline<CR>", "Symbols Outline" },
            e = { ":NvimTreeToggle<CR>", "File Tree" },
            z = { ":ZenMode<CR>", "Zen Mode" },
            n = { ":set norelativenumber<CR>", "Disable relative numbers" },
            N = { ":set relativenumber<CR>", "Enable relative numbers" },
            w = { ":lua OpenLink()<CR>", "Open Url" },
            o = { "zo", "Open Fold" },
            O = { "zc", "Close Fold" },
            a = { "zR", "Open All Fold" }
        },
        e = {
            name = "+Essentials",
            m = { ":lua GolangMock()<CR>", "Golang Mock" },
            c = { ":lua Coverage()<CR>", "Golang Coverage" },
        },
        g = {
            name = "+Git",
            s = { ":lua require('gitsigns').stage_hunk()<CR>", "Stage Hunk" },
            S = { ":lua require('gitsigns').stage_buffer()<CR>", "Stage Buffer" },
            u = { ":lua require('gitsigns').undo_stage_hunk()<CR>", "Unstage Hunk" },
            r = { ":lua require('gitsigns').reset_hunk()<CR>", "Reset Hunk" },
            R = { ":lua require('gitsigns').reset_buffer()<CR>", "Reset Buffer" },
            U = { ":lua require('gitsigns').reset_buffer_index()<CR>", "Reset Buffer" },
            p = { ":lua require('gitsigns').preview_hunk()<CR>", "Preview Hunk" },
            b = { ":lua require('gitsigns').blame_line(true)<CR>", "Blame Line" },

        },
        y = {
            ["<"] = { "yi<", "Stage Hunk" },
        }
    },
        { prefix = "<leader>", mode = "n", noremap = true }),

    wk.register({
        ["/"] = {
            name = "Comment"
        },
        g = {
            name = "+Git",
            s = { ":lua require('gitsigns').stage_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>", "Stage Hunk" },
            r = { ":lua require('gitsigns').reset_hunk({vim.fn.line('.'), vim.fn.line('v')})<CR>", "Reset Hunk" },
            i = { ":<C-U>lua require('gitsigns.actions').select_hunk()<CR>", "Select Hunk" },
        }
    },
        { prefix = "<leader>", mode = "v", noremap = true }),

}
