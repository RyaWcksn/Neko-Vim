local no_err, lsp_installer = pcall(require,"nvim-lsp-installer")
if not no_err then
    return
end

local module = require('utils.nekorc')

lsp_installer.on_server_ready(function(server)
    local opts = {
		on_attach = require("core.lspconfig-nvim.handler").on_attach,
		capabilities = require("core.lspconfig-nvim.handler").capabilities,
	}
	local lsp_installer_servers = require("nvim-lsp-installer.servers")
    local servers = module.languages.servers

	for _, name in pairs(servers) do
		---@diagnostic disable-next-line: redefined-local
		local ok, server = lsp_installer_servers.get_server(name)
		if ok then
			if not server:is_installed() then
				server:install()
			end
		end
	end

	server:setup(opts)
	vim.cmd([[ do User LspAttachBuffers ]])
end)
