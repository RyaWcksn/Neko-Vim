function LspSymbol(name, icon)
    vim.fn.sign_define("LspDiagnosticsSign" .. name, {text = icon, numhl = "LspDiagnosticsDefaul" .. name})
    lspSymbol("Error", "")
    lspSymbol("Warning", "")
    lspSymbol("Information", "")
    lspSymbol("Hint", "")
end
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = {
            prefix = "● ",
            spacing = 0
        },
        signs = true,
        underline = true,
        update_in_insert = true
    }
)

-- -- suppress error messages from lang servers
vim.notify = function(msg, log_level)
    if msg:match("exit code") then
        return
    end
    if log_level == vim.log.levels.ERROR then
        vim.api.nvim_err_writeln(msg)
    else
        vim.api.nvim_echo({{msg}}, true, {})
    end
  end

-- languages
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
---@diagnostic disable-next-line: redefined-local
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

vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local border = {
      {"╭", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╮", "FloatBorder"},
      {"│", "FloatBorder"},
      {"╯", "FloatBorder"},
      {"─", "FloatBorder"},
      {"╰", "FloatBorder"},
      {"│", "FloatBorder"},
}

-- LSP settings (for overriding per client)
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border}),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border }),
}

-- Do not forget to use the on_attach function
local LspServer = {
  "bashls",
  "cssls",
  "html",
  "jsonls",
  "pyright",
  "tsserver",
  "gopls"
}

for _, v in pairs(LspServer) do
    require('lspconfig')[v].setup { handlers=handlers }
end

-- To instead override globally
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Print diagnostics to the status line
function PrintDiagnostics(opts, bufnr, line_nr)
  bufnr = bufnr or 0
  line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
  opts = opts or {['lnum'] = line_nr}

  local line_diagnostics = vim.diagnostic.get(bufnr, opts)
  if vim.tbl_isempty(line_diagnostics) then return end

  local diagnostic_message = ""
  for i, diagnostic in ipairs(line_diagnostics) do
    diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
    print(diagnostic_message)
    if i ~= #line_diagnostics then
      diagnostic_message = diagnostic_message .. "\n"
    end
  end
  vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
end

vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

vim.diagnostic.config({
    source = "always",  -- Or "if_many"
    virtual_text = false,
    signs = true,
    prefix = '●', -- Could be '●', '▎', 'x'
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})
