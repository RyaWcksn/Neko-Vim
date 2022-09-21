-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
--
--
local workspace_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local home = os.getenv('HOME')

local config = {
    -- The command that starts the language server
    require 'jdtls.setup'.add_commands(),
    require 'jdtls'.setup_dap(),
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.level=ALL',
        '-noverify',
        '-Xmx1G',
        '-jar', home .. '/Documents/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
        '-configuration', home .. '/Documents/config_mac/',
        '-data', vim.fn.expand(home .. '/jdtls-workspace') .. workspace_dir,
    },

    capabilities = capabilities,
    root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }),

    settings = {
        java = {
        }
    },
    init_options = {
        bundles = {}
    },
    codeGeneration = {
        toString = {
            template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}"
        },
        hashCodeEquals = {
            useJava7Objects = true,
        },
        useBlocks = true,
    },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
