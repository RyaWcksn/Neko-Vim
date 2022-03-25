local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("core.lspconfig-nvim.handler").setup()
require("core.lspconfig-nvim.lsp_installer")
require("core.lspconfig-nvim.null-ls")
