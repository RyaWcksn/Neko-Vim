local present, nvimtree = pcall(require, "nvim-tree")

if not present then
    return
end

local g = vim.g

vim.o.termguicolors = true
g.nvim_tree_add_trailing = 0
g.nvim_tree_show_icons = {
   folders = 1,
   files = 1,
   git = 1,
   folder_arrows = 0,
}
g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        deleted = "",
        ignored = "◌",
        renamed = "➜",
        staged = "✓",
        unmerged = "",
        unstaged = "✗",
        untracked = "★",
    },
    icons = {
        webdev_colors = true,
        git_placement = "before",
    },
    folder = {
        default = "",
        empty = "", -- 
        empty_open = "",
        open = "",
        symlink = "",
        symlink_open = "",
    },
}
nvimtree.setup {
    diagnostics                        = {
        enable = false,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    disable_netrw                      = false,
    hijack_netrw                       = true,
    open_on_setup                      = false,
    ignore_ft_on_setup                 = {},
    auto_reload_on_write               = true,
    open_on_tab                        = false,
    hijack_cursor                      = false,
    update_cwd                         = false,
    hijack_unnamed_buffer_when_opening = false,
    hijack_directories                 = {
        enable = true,
        auto_open = true,
    },
    view                               = {
        side = "left",
        hide_root_folder = false,
        preserve_window_proportions = false,
        width = 25,
        mappings = {
            custom_only = false,
            list = {
                { key = "l", action = "edit", action_cb = edit_or_open },
                { key = "L", action = "vsplit_preview", action_cb = vsplit_preview },
                { key = "h", action = "close_node" },
                { key = "H", action = "collapse_all", action_cb = collapse_all }
            }
        },
    },
    renderer                           = {
        indent_markers = {
            enable = false,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            webdev_colors = true,
        },
    },
    filters                            = {
        dotfiles = false,
        custom = {}
    },
    git                                = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    actions                            = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
    trash                              = {
        cmd = "trash",
        require_confirm = true,
    },
}
