-- local present1, lspconfig = pcall(require, "lspconfig")
-- local present2, lspinstall = pcall(require, "lspinstall")
-- if not (present1 or present2) then
--     return
-- end
-- 
-- local function on_attach(client, bufnr)
--     vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
--     local opts = {noremap = true, silent = true}
-- 
--     local function buf_set_keymap(...)
--         vim.api.nvim_buf_set_keymap(bufnr, ...)
--     end
--     buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--     buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
--     buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
--     buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--     buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--     buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
--     buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
--     buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
--     buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
--     buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
--     buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--     buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
--     buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
--     buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
--     buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
-- 
--     -- Set some keybinds conditional on server capabilities
--     if client.resolved_capabilities.document_formatting then
--         buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
--     elseif client.resolved_capabilities.document_range_formatting then
--         buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
--     end
-- end
-- 
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
-- 
-- local nvim_lsp = require('lspconfig')
-- 
-- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'sumneko_lua', 'bashls'}
-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end
-- 
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- 
-- -- lspInstall + lspconfig stuff
-- 
-- local nvim_lsp = require('lspconfig')
-- 
-- -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
-- 
-- -- replace the default lsp diagnostic symbols
function lspSymbol(name, icon)
    vim.fn.sign_define("LspDiagnosticsSign" .. name, {text = icon, numhl = "LspDiagnosticsDefaul" .. name})
end
-- 
lspSymbol("Error", "")
lspSymbol("Warning", "")
lspSymbol("Information", "")
lspSymbol("Hint", "")

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = {
            prefix = "",
            spacing = 0
        },
        signs = true,
        underline = true,
        -- set this to true if you want diagnostics to show in insert mode
        update_in_insert = false
    }
)

-- -- suppress error messages from lang servers
-- vim.notify = function(msg, log_level, _opts)
--     if msg:match("exit code") then
--         return
--     end
--     if log_level == vim.log.levels.ERROR then
--         vim.api.nvim_err_writeln(msg)
--     else
--         vim.api.nvim_echo({{msg}}, true, {})
--     end
--   end
-- 
-- .
local lsp = require('lspconfig')
lsp.gopls.setup(require('lang.go').lsp)
lsp.tsserver.setup(require('lang.js').lsp)
lsp.pyright.setup(require('lang.python').lsp)
lsp.tsserver.setup(require('lang.ts').lsp)
lsp.phpactor.setup(require('lang.php').lsp)
