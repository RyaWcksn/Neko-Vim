local cmd = vim.cmd

require('mappings')
require('options')
require('plugins')
require('autocmd')
require('nekorc')
require('lsp')
require('plugins/treesitter')
require('plugins/neorg')
require('plugins/twilight')
require('plugins/lualine')
require('plugins/bufferline')
-- require('plugins/shade')
-- require('plugins/onedark')
require('plugins/cmp')
require('plugins/cmp-tabnine')
-- require('plugins/lspinstall')
require('plugins/lspconfig')
require('plugins/telescope')
require('plugins/nvimtree')
require('plugins/comment')
-- require('plugins/presence')
require('plugins/autopairs')
require('plugins/orgmode')
require('plugins/truezen')
require('plugins/dashboard')
require('plugins/lsp-signature')
require('plugins/gitsigns')
require('plugins/nvim-gps')
require('plugins/indentline')
require('plugins/lazygit')
require('plugins/glow')
require('plugins/spotify')
require('plugins/hop')
-- require('plugins/sniprun')
-- require('catppuccino')
-- require('plugins/session')
-- require('plugins/navigator')
-- require('plugins/go')
require('plugins/lsp-server-install')
cmd[[colorscheme onedark]]
-- vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.opt.fillchars = {eob = " "}
