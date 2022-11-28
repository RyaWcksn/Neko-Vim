local ok, wk = pcall(require, "which-key")
if not ok then
    print("which-key not found, please install it.")
    os.exit(1)
end

local mapping = require("utils.mappings")

function OpenLink()
    if vim.fn.has("mac") == 1 then
        vim.api.nvim_command("execute '!open ' . shellescape('<cWORD>')")
    else
        vim.api.nvim_command("silent execute '!xdg-open ' . shellescape(expand('<cfile>'), 1)")
    end
end

function OpenTerminal(dir)
    local Terminal = require('toggleterm.terminal').Terminal
    local Term = Terminal:new({
        open_mapping = [[<c-\>]],
        direction = dir,
        close_on_exit = false,
        on_close = function()
            vim.cmd("startinsert!")
        end,
        on_open = function()
            vim.cmd("startinsert!")
        end,
    })
    Term:toggle()
end

function RunProgram()
    local file     = vim.fn.expand("%")
    local ext      = GetFileExtension(file)
    local Terminal = require('toggleterm.terminal').Terminal
    Cmd            = {}
    --[[ local str      = debug.getinfo(2, "S").source:sub(2)
    print(str:match "^.*.(out)$") ]]
    local handle   = assert(io.popen("pwd", 'r'))
    local output   = assert(handle:read('*a'))
    if ext == ".py" then
        Cmd.execute = { "python3", file }
        local cmd = table.concat(Cmd.execute, " ")
        runFile = Terminal:new({
            cmd = cmd,
            hidden = true,
            close_on_exit = false,
        })
        runFile:toggle()
    end
    if ext == ".js" then
        Cmd.execute = { "node", file }
        local cmd = table.concat(Cmd.execute, " ")
        runFile = Terminal:new({
            cmd = cmd,
            hidden = true,
            close_on_exit = false,
        })
        runFile:toggle()
    end
    if ext == ".c" then
        Cmd.execute = { "gcc", file, "&&", "./a.out" }
        local cmd = table.concat(Cmd.execute, " ")
        runFile = Terminal:new({
            cmd = cmd,
            hidden = true,
            close_on_exit = false,
        })
        runFile:toggle()
    end
    if ext == ".cpp" then
        Cmd.execute = { "g++", file, "&&", "./a.out" }
        local cmd = table.concat(Cmd.execute, " ")
        runFile = Terminal:new({
            cmd = cmd,
            hidden = true,
            close_on_exit = false,
        })
        runFile:toggle()
    end
    if ext == ".go" then
        local path = output .. "/main.go"
        Cmd.execute = { "go", "run", path }
        local cmd = table.concat(Cmd.execute, " ")
        runFile = Terminal:new({
            cmd = cmd,
            hidden = true,
            close_on_exit = false,
        })
        runFile:toggle()
    end
end

function GetFileExtension(url)
    return url:match("^.+(%..+)$")
end

wk.setup {
    {
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
            presets = {
                operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = false, -- adds help for motions
                text_objects = false, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <c-w>
                nav = false, -- misc bindings to work with windows
                z = false, -- bindings for folds, spelling and others prefixed with z
                g = false, -- bindings for prefixed with g
            },
        },
        icons = {
            breadcrumb = ">>", -- symbol used in the command line area that shows your active key combo
            separator = "->", -- symbol used between a key and it's label
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

    wk.register({ mapping.Vmapping }, { prefix = "<leader>", mode = "v", noremap = true }),
    wk.register({ mapping.Mapping }, { prefix = "<leader>", mode = "n", noremap = true }),
}
