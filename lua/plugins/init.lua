vim.cmd 'autocmd BufwritePost plugins.lua PackerCompile'
vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")

local packerPath = vim.fn.stdpath('data') .. '/site'
vim.o.packpath = packerPath .. ',' .. vim.o.packpath

require('packer').init({ display = { auto_clean = false } })
local packer = require('packer')

packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "single" }
        end,
    },
    git = {
        clone_timeout = 300, -- 5 mins
    },
    profile = {
        enable = true,
    },
    max_jobs = 10
}

return require('packer').startup(function(use)
    use { 'wbthomason/packer.nvim' }

    -- Which Key
    use {
        "folke/which-key.nvim",
        config = function()
            require("core.whichkey-nvim")
        end
    }

    -- Colorizer
    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup()
        end
    }

    -- Theme
    use { "catppuccin/nvim", as = "catppuccin" , config = function ()
        require('core.catppuccin')
    end}
    use { 'shaunsingh/oxocarbon.nvim', run = './install.sh' }
    use { 'bluz71/vim-moonfly-colors' }
    use { 'bluz71/vim-nightfly-guicolors' }
    use { 'Lokaltog/vim-monotone' }
    use { 'preservim/vim-colors-pencil' }
    use { 'pbrisbin/vim-colors-off' }
    use { 'danishprakash/vim-yami' }
    use { 'NLKNguyen/papercolor-theme' }

    -- Test
    use {
        "klen/nvim-test",
        config = function()
            require("core.test-nvim")
        end
    }

    -- Dashboard
    --[[ use {
        'glepnir/dashboard-nvim',
        event = "VimEnter",
        cmd = {
            "Dashboard",
        },
        config = function()
            require('core.dashboard-nvim')
        end
    } ]]

    -- Notify
    use { 'rcarriga/nvim-notify' }

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
    }

    -- CMP
    use {
        'hrsh7th/nvim-cmp',
        config = function()
            require('core.cmp-nvim')
        end
    }
    --[[ use {
        'hrsh7th/cmp-nvim-lsp-signature-help'
    } ]]
    use {
        'hrsh7th/cmp-nvim-lsp',
        after = "nvim-cmp"
    }
    use {
        'hrsh7th/cmp-calc',
    }
    use {
        'hrsh7th/cmp-path',
        after = "cmp-calc"
    }
    use {
        'saadparwaiz1/cmp_luasnip',
        after = 'nvim-cmp'
    }

    -- Check startup time speed
    use { 'dstein64/vim-startuptime' }

    -- Sniprun
    use {
        'michaelb/sniprun',
        run = 'bash ./install.sh',
        config = function()
            require('core.sniprun-nvim')
        end
    }
    use {
        'is0n/jaq-nvim',
        config = function()
            require('core.jaq-nvim')
        end
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
        config = function()
            require('core.treesitter-nvim')
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
            require('core.treesitter-nvim')
        end
    }

    -- Line
    use {
        'hoob3rt/lualine.nvim',
        config = function()
            require('core.lualine-nvim')
        end
    }

    -- Winbar
    use {
        'fgheng/winbar.nvim',
        config = function()
            require('core.winbar-nvim')
        end
    }

    -- File tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
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
    use { 'nvim-lua/plenary.nvim' }
    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            require('core.telescope-nvim')
        end
    }
    use { 'nvim-telescope/telescope-media-files.nvim' }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }


    -- Lsp
    use {
        'neovim/nvim-lspconfig',
        config = function()
            require('core.lspconfig-nvim')
        end
    }
    use { 'onsails/lspkind-nvim' }
    --[[ use {
        "ray-x/lsp_signature.nvim",
        after = "nvim-lspconfig",
        config = function()
            require('core.signature-nvim')
        end
    } ]]
    use { 'williamboman/nvim-lsp-installer' }

    -- Autopairs tag
    use {
        'windwp/nvim-autopairs',
        after = "nvim-cmp",
        config = function()
            require('core.autopairs-nvim')
        end
    }

    -- Discord Rich Presence
    use {
        'andweeb/presence.nvim',
        config = function()
            require('core.presence-nvim')
        end
    }


    -- Comment
    use { 'b3nj5m1n/kommentary' }

    -- Floating terminal
    use { 'voldikss/vim-floaterm' }
    use { "akinsho/toggleterm.nvim" }

    -- Zen Mode
    use {
        'folke/zen-mode.nvim',
        cmd = {
            "ZenMode"
        }
    }

    -- Multiple cursors
    use { "terryma/vim-multiple-cursors" }

    -- Git
    use {
        'lewis6991/gitsigns.nvim',
        event = "BufRead",
        config = function()
            require('core.gitsign-nvim')
        end
    }

    -- Sudo write
    use { 'lambdalisue/suda.vim' }

    -- Snipper
    use { 'L3MON4D3/LuaSnip' }
    use { "rafamadriz/friendly-snippets" }

    -- Database
    --[[ use { 'tpope/vim-dadbod' }
    use { 'kristijanhusak/vim-dadbod-ui' } ]]
    use { 'lewis6991/impatient.nvim' }

    -- FZF
    use { 'junegunn/fzf' }
    use { 'junegunn/fzf.vim' }

    -- Code snip
    use {
        'kristijanhusak/vim-carbon-now-sh',
        event = "BufRead",
        cmd = {
            "CarbonNowSh",
        }
    }

    --[[ -- Copilot
    use { 'github/copilot.vim' } ]]

    -- Java
    use { 'mfussenegger/nvim-jdtls',

    }

    -- Hopping words
    use {
        'phaazon/hop.nvim',
        as = 'hop',
        config = function()
            require 'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }

    -- Outline
    use { "simrat39/symbols-outline.nvim" }

    -- Trouble
    use { "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
            }
        end
    }
    use {
        'ray-x/go.nvim',
        config = function()
            require('go').setup()
        end
    }
    use { 'MunifTanjim/nui.nvim' }
    use { 'VonHeikemen/searchbox.nvim' }
    use 'ray-x/guihua.lua' -- recommanded if need floating window support
    use 'nvim-treesitter/playground'
    use {
        'mfussenegger/nvim-dap',
        opt = true,
        event = "BufReadPre",
        module = { "dap" },
        wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
        requires = {
            "Pocco81/DAPInstall.nvim",
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
            "nvim-telescope/telescope-dap.nvim",
            { "leoluz/nvim-dap-go", module = "dap-go" },
            { "jbyuki/one-small-step-for-vimkind", module = "osv" },
        },
        config = function()
            require('core.dap-nvim')
        end
    }
    --[[ use({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    }) ]]
    -- Wakatime
    use 'wakatime/vim-wakatime'
    -- using packer.nvim
    use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require("bufferline").setup {}
        end
    }
end
)
