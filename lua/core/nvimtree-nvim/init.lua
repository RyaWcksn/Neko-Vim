local present, nvimtree = pcall(require, "nvim-tree")

if not present then
    return
end

local g = vim.g

vim.o.termguicolors = true
g.nvim_tree_add_trailing = 0
g.nvim_tree_show_icons = {
    folder_arrow = 0
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
    -- auto_close           = false,
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
        width = 25,
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
}
