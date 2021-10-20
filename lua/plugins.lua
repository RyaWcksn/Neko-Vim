return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use 'akinsho/bufferline.nvim'
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }
  use 'navarasu/onedark.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'onsails/lspkind-nvim'
  use 'windwp/nvim-autopairs'
  use 'L3MON4D3/LuaSnip'
  use "terrortylor/nvim-comment"
  use 'andweeb/presence.nvim'
  use {
      "glepnir/dashboard-nvim",
      cmd = {
        "Dashboard",
        "DashboardNewFile",
        "DashboardJumpMarks",
        "SessionLoad",
        "SessionSave"
      },
      setup = function()
      require "plugins.dashboard"
      end
      }
  -- use "mhinz/vim-startify"
  use 'kristijanhusak/orgmode.nvim'
  use {'tzachar/cmp-tabnine', run='./install.sh'}
  use 'nvim-telescope/telescope-media-files.nvim'
  use 'voldikss/vim-floaterm'
  use "Pocco81/TrueZen.nvim"
  use 'folke/zen-mode.nvim'
  use "terryma/vim-multiple-cursors"
  use "vimwiki/vimwiki"
  use "akinsho/org-bullets.nvim"
  use {
      'lukas-reineke/headlines.nvim',
        config = function()
        require('headlines').setup()
        end,
      }
  use { 'michaelb/sniprun', run = 'bash ./install.sh'}

end)
