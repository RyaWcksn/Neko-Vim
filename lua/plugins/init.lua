vim.cmd 'autocmd BufwritePost plugins.lua PackerCompile'

require('packer').init({display = {auto_clean = false}})
local packer = require('packer')
local use = require('packer').use

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
}

return require('packer').startup(function()
    use {'wbthomason/packer.nvim'}

    -- Theme
    use {'bluz71/vim-moonfly-colors'}
    use {'bluz71/vim-nightfly-guicolors'}
    use {'folke/tokyonight.nvim'}
    use {'Lokaltog/vim-monotone'}
    use {'preservim/vim-colors-pencil'}
    use {'pbrisbin/vim-colors-off'}
    use {'danishprakash/vim-yami'}

    -- Null lsp
    use {
        'jose-elias-alvarez/null-ls.nvim',
        config = function ()
            require('core.nullls-nvim')
        end
    }

    -- Note taking
    use {"vimwiki/vimwiki"}
    use {"akinsho/org-bullets.nvim"}
    use {'lervag/vimtex'}
    use {
        'nvim-orgmode/orgmode',
        config = function()
            require('core.orgmode-nvim')
        end
    }
    use {
        'lukas-reineke/headlines.nvim',
          config = function()
            require('headlines').setup()
          end,
    }

    -- Dashboard
    use {
        'glepnir/dashboard-nvim',
        event = "BufEnter",
        cmd = {
            "Dashboard",
            "DashboardChangeColorscheme",
            "DashboardFindFile",
            "DashboardFindHistory",
            "DashboardFindWord",
            "DashboardNewFile",
            "DashboardJumpMarks",
            "SessionLoad",
            "SessionSave"
        },
        config = function()
            require('core.dashboard-nvim')
        end
    }

    -- transparency
    use {
        'xiyaowong/nvim-transparent',
        config = function()
            require('core.transparent-nvim')
        end
    }

    -- Notify
    use {'rcarriga/nvim-notify'}

    -- Indent Line
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require('core.indentline-nvim')
        end
    }

    -- Icons
    use {
        'kyazdani42/nvim-web-devicons',
        event = "BufEnter"
    }

    -- CMP
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require('core.cmp-nvim')
        end
    }
    use {
        'hrsh7th/cmp-nvim-lsp',
    }
    use {
        'hrsh7th/cmp-calc'
    }
    use {
        'hrsh7th/cmp-nvim-lua',
        after = "cmp-calc"
    }
    use {
        'hrsh7th/cmp-path',
        after = "cmp-nvim-lua"
    }
    use {
        'hrsh7th/cmp-vsnip',
        after = 'nvim-cmp'
    }
    use {
        'tzachar/cmp-tabnine',
        run='./install.sh'
    }

    -- Check startup time speed
    use {'dstein64/vim-startuptime'}

    -- Spotify
    use {'stsewd/spotify.nvim'}

    use {
        'michaelb/sniprun',
        run = 'bash ./install.sh',
        config = function()
            require('core.sniprun-nvim')
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
        config = function()
            require('core.treesitter-nvim')
        end
    }
    use {
        'hoob3rt/lualine.nvim',
        after = "bufferline.nvim",
        config = function()
            require('core.lualine-nvim')
        end
    }

    -- Bufferline on top
    use {
        'akinsho/bufferline.nvim',
        after = "nvim-web-devicons",
        config = function()
            require('core/bufferline-nvim')
        end
    }

    -- File tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        after = "dashboard.nvim",
        cmd = {
            "NvimTreeOpen",
            "NvimTreeFocus",
            "NvimTreeToggle",
        },
        config = function()
            require('core/nvimtree-nvim')
        end
    }

    -- Telescope
    use {'nvim-lua/plenary.nvim'}
    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            require('core.telescope-nvim')
        end
    }
    use {"nvim-telescope/telescope-file-browser.nvim"}
    use {'nvim-telescope/telescope-media-files.nvim'}


    -- Lsp
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('core.lspconfig-nvim')
        end
    }
    use {'onsails/lspkind-nvim'}
    use {
        "ray-x/lsp_signature.nvim",
        after = "nvim-lspconfig",
        config = function()
            require('core.signature-nvim')
        end
    }
    use {'williamboman/nvim-lsp-installer'}

    -- Autopairs tag
    use {
        'windwp/nvim-autopairs',
        after = "nvim-cmp",
        config = function()
            require('core.autopairs-nvim')
        end
    }

    -- Discord Rich Presence
    use {'andweeb/presence.nvim'}


    -- Comment
    use {'b3nj5m1n/kommentary'}

    -- Floating terminal
    use {'voldikss/vim-floaterm'}

    -- Zen Mode
    use {
        'folke/zen-mode.nvim',
        cmd = {
            "ZenMode"
        }
    }

    -- Multiple cursors
    use {"terryma/vim-multiple-cursors"}

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        event = "BufRead",
        config = function()
            require('core.gitsign-nvim')
        end
    }
    use {'kdheepak/lazygit.nvim'}

    -- Suround
    use {'tpope/vim-surround'}

    -- Sudo write
    use {'lambdalisue/suda.vim'}

    -- Snipper
    use {'hrsh7th/vim-vsnip'}

    -- Database
    use { 'tpope/vim-dadbod' }
    use { 'kristijanhusak/vim-dadbod-ui' }
    use {
        'lewis6991/impatient.nvim',
        config = function()
            require('core.impatient-nvim')
        end
    }

    -- Ranger plugin
    use {'kevinhwang91/rnvimr'}

    -- FZF
    use {'junegunn/fzf'}
    use {'junegunn/fzf.vim'}

    -- Code snip
    use {'kristijanhusak/vim-carbon-now-sh'}

    -- Copilot
    use {'github/copilot.vim'}

    -- Light
    use {
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup{}
        end
    }

    -- Hopping words
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    -- Trouble
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
        }
        end
    }
end
)
