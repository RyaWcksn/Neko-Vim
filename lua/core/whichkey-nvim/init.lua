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

wk.setup{
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
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
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
        }
    },
    o = { ":SymbolsOutline<CR>", "Symbols Outline" },
    f = {
        name = "+Files",
        f = { ":FZF<CR>", "Find Files" }
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
        s = { ":lua package.loaded.presence:cancel()", "Stop Discord" },
        d = { ":lua package.loaded.presence:update()", "Start Discord" },
    },
    t = {
        name = "+Terminal",
        t = { ":20new +terminal | setlocal nobuflisted <CR>", "Open Terminal" },
        ["<Leader>"] = {
            t = { ":term<CR>", "Open Terminal" },
        }
    },
    z = {
        name = "+Zen",
        z = { ":ZenMode<CR>", "Zen" },
    },
    b = {
        name = "+Buffer",
        t = { ":enew<CR>", "New Buffer" },
    },
    u = {
        name = "+Unit testing",
        w = { ":UltestNearest<CR>", "Test Function"},
        s = { ":UltestSummary<CR>", "Test Summary"}
    },
    l = {
        name = "+LSP",
        f = { ":lua vim.lsp.buf.formatting()<CR>", "Format" },
        c = { ":lua vim.lsp.buf.code_action()<CR>", "Code Action" },
        r = { ":lua Rename.rename()<CR>", "Rename" },
        a = { ":lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic" },
        d = { ":lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
        w = { ":lua vim.lsp.buf.references()<CR>", "References" },
        t = { ":Trouble<CR>", "Errors"}

    },
    cd = { ":cd %:h<CR>", "Change Directory" },
    n = { ":set norelativenumber<CR>", "Disable relative numbers" },
    N = { ":set relativenumber<CR>", "Enable relative numbers" },
},
{ prefix = "<leader>" }),

}
