vim.cmd 'autocmd BufwritePost plugins.lua PackerCompile'

require('packer').init({display = {auto_clean = false}})
local packer = require('packer');

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
}
return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'folke/tokyonight.nvim'
    use 'dstein64/vim-startuptime'
    use 'rcarriga/nvim-notify'
    use 'stsewd/spotify.nvim'
    use { 'michaelb/sniprun', run = 'bash ./install.sh'}
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
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-calc'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'neovim/nvim-lspconfig'
    -- use 'kabouzeid/nvim-lspinstall'
    use 'onsails/lspkind-nvim'
    use 'windwp/nvim-autopairs'
    use 'andweeb/presence.nvim'
    use 'glepnir/dashboard-nvim'
    use 'b3nj5m1n/kommentary'
    use {'tzachar/cmp-tabnine', run='./install.sh'}
    use 'nvim-telescope/telescope-media-files.nvim'
    use 'voldikss/vim-floaterm'
    use 'folke/zen-mode.nvim'
    use "terryma/vim-multiple-cursors"
    use "vimwiki/vimwiki"
    use "akinsho/org-bullets.nvim"
    use 'danishprakash/vim-yami'
    use {
        'lukas-reineke/headlines.nvim',
          config = function()
          require('headlines').setup()
          end,
        }
    use "ray-x/lsp_signature.nvim"
    use 'lewis6991/gitsigns.nvim'
    use 'tpope/vim-surround'
    use 'lambdalisue/suda.vim'
    use 'mattn/calendar-vim'
    use 'hrsh7th/vim-vsnip'
    use 'williamboman/nvim-lsp-installer'
    -- Database
    use { 'tpope/vim-dadbod' }
    use { 'kristijanhusak/vim-dadbod-ui' }
    use 'preservim/vim-colors-pencil'
    use 'pbrisbin/vim-colors-off'
    use 'lewis6991/impatient.nvim'
    use 'Lokaltog/vim-monotone'
    use 'hrsh7th/cmp-vsnip'
    use 'kdheepak/lazygit.nvim'
    use 'kevinhwang91/rnvimr'
    use 'bluz71/vim-moonfly-colors'
    use 'bluz71/vim-nightfly-guicolors'
    use 'junegunn/fzf'
    use 'junegunn/fzf.vim'
    use 'lervag/vimtex'
    use 'kristijanhusak/vim-carbon-now-sh'
    use 'github/copilot.vim'
    use "nvim-telescope/telescope-file-browser.nvim"
    use {
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    }
    use {
      'phaazon/hop.nvim',
      as = 'hop',
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    }
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end,
    }
    use {'nvim-orgmode/orgmode', config = function()
        require('orgmode').setup{}
    end
    }
end)

