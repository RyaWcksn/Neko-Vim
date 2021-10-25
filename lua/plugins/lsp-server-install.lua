local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function (:help lspconfig-quickstart)
    local lsp_installer_servers = require'nvim-lsp-installer.servers'

    local servers = {
      "bashls",
      "vuels",
      "cland",
      "cssls",
      "html",
      "jsonls",
      "sumneko_lua",
      "phpactor",
      "pyright",
      "solargraph",
      "tsserver"
    }

    for _ , name  in pairs(servers) do
      local ok, server = lsp_installer_servers.get_server(name)
        if ok then
          if not server:is_installed() then
            print("Installing")
            server:install()
          end
        end
    end

    server:setup(opts)
    vim.cmd [[ do User LspAttachBuffers ]]
end)
