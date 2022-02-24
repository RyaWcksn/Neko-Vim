local present, nvimtree = pcall(require, "nvim-tree")

if not present then
   return
end

local g = vim.g

vim.o.termguicolors = true
g.nvim_tree_add_trailing = 0
g.nvim_tree_indent_markers = 1
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
   folder = {
      -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
      -- arrow_open = "",
      -- arrow_closed = "",
      default = "",
      empty = "", -- 
      empty_open = "",
      open = "",
      symlink = "",
      symlink_open = "",
   },
}
nvimtree.setup {
   diagnostics = {
      enable = false,
      icons = {
        hint = "",
        info = "",
        warning = "",
        error = "",
        default = "",
        empty = "", -- 
        empty_open = "",
        open = "",
        symlink = "",
        symlink_open = "",
      },
   },
   disable_netrw        = false,
   hijack_netrw         = true,
   open_on_setup        = false,
   ignore_ft_on_setup   = {},
   auto_close           = false,
   auto_reload_on_write = true,
   open_on_tab          = false,
   hijack_cursor        = false,
   update_cwd           = false,
   hijack_unnamed_buffer_when_opening = false,
   hijack_directories   = {
    enable = true,
    auto_open = true,
   },
   view = {
    allow_resize = true,
    side = "left",
    width = 25,
   },
    filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
}
