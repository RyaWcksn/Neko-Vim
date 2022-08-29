local ok, wk = pcall(require, "which-key")
if not ok then
    print("which-key not found, please install it.")
    os.exit(1)
end

-- Golang Mock
function GolangMock()
    local file = vim.fn.expand("%")
    local output = file:match "(.+)%..+$" .. "_mock.go"
    local source = file:match "^.+/(.+)$"
    local package = vim.fn.input("Package name: ")
    local cmd = { "mockgen", "-source", source, "-destination", output, "-package", package }
    os.execute(table.concat(cmd, " "))
    print(", Mock file generated: " .. output .. " Package: " .. package)
    vim.notify("Go mock created", "Info", {
        title = "Go mock"
    })
end

function OpenLink()
    if vim.fn.has("macunix") == 1 then
        vim.api.nvim_command("silent execute '!open ' . shellescape('<cWORD>')")
    else
        vim.api.nvim_command("silent execute '!xdg-open ' . shellescape(expand('<cfile>'), 1)")
    end
end

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
            winblend = 0,
        },
        layout = {
            height = { min = 4, max = 25 }, -- min and max height of the columns
            width = { min = 20, max = 50 }, -- min and max width of the columns
            spacing = 3, -- spacing between columns
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
            d = { "::bd|e#<CR>", "Delete Buffer" },

        },
        u = {
            name = "+Unit testing",
            w = { ":TestNearest<CR>", "Test Function" },
            s = { ":TestFile<CR>", "Test File" },
            a = { ":TestSuite<CR>", "Test All" }
        },
        l = {
            name = "+LSP",
            f = { ":lua vim.lsp.buf.format()<CR>", "Code Format" },
            c = { ":lua vim.lsp.buf.code_action()<CR>", "Code Action" },
            s = { ":lua vim.lsp.buf.signature_help()<CR>", "Code Signature" },
            d = { ":lua vim.lsp.buf.definition()<CR>", "Code Definition" },
            i = { ":lua vim.lsp.buf.implementation()<CR>", "Code Implementation" },
            w = { ":lua vim.lsp.buf.references()<CR>", "Code References" },
            l = { ":lua vim.lsp.codelens.run()<CR>", "Code Lens" },
            r = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
            t = { ":Telescope diagnostics<CR>", "Error Diagnostics" },
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
            a = { "zR", "Open All Fold" },
            t = { ":10new +terminal<CR>", "Open Terminal" }
        },
        e = {
            name = "+Essentials",
            m = { ":lua GolangMock()<CR>", "Golang Mock" },
            c = { ":lua Code()<CR>", "Golang Coverage" },
            s = { ":lua package.loaded.presence:cancel()<CR>", "Stop Discord" },
            d = { ":lua package.loaded.presence:update()<CR>", "Start Discord" },
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
            g = {
                name = "+Golang",
                t = { ":lua GO_TIDY()<CR>", "Go Mod Tidy" },
                m = { ":lua GolangMock()<CR>", "Go Mock" },
            },
        }
    },
        { prefix = "<leader>", mode = "n", noremap = true }),

    wk.register({
        ["/"] = {
            name = "Comment"
        },
        g = {
            name = "+Git",
            s = { ":Gitsigns stage_hunk<CR>", "Stage Hunk" },
            r = { ":Gitsigns reset_hunk<CR>", "Reset Hunk" },
            i = { ":<C-U>lua require('gitsigns.actions').select_hunk()<CR>", "Select Hunk" },
        }
    },
        { prefix = "<leader>", mode = "v", noremap = true }),
}
