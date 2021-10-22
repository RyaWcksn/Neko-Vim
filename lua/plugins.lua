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
  use 'glepnir/dashboard-nvim'
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
  use  "ray-x/lsp_signature.nvim"
  use 'skywind3000/vim-quickui'
  use 'tpope/vim-fugitive'
  use 'nvim-telescope/telescope-packer.nvim'
  use 'mangeshrex/uwu.vim'
  use 'ntk148v/vim-horizon'
  use 'lewis6991/gitsigns.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  -- use "tversteeg/registers.nvim"
  use 'lambdalisue/suda.vim'
  use "norcalli/nvim-colorizer.lua"
  use {
      "NTBBloodbath/rest.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("rest-nvim").setup({
          -- Open request results in a horizontal split
          result_split_horizontal = false,
          -- Skip SSL verification, useful for unknown certificates
          skip_ssl_verification = false,
          -- Highlight request on run
          highlight = {
            enabled = true,
            timeout = 150,
          },
          -- Jump to request line on run
          jump_to_request = false,
        })
      end
    }
  use {'stevearc/gkeep.nvim', run = ':UpdateRemotePlugins'}
  use {
      "SmiteshP/nvim-gps",
      requires = "nvim-treesitter/nvim-treesitter"
      }
  use 'michaelb/sniprun'
  use 'mattn/calendar-vim'
end)
