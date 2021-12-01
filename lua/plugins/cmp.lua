-- Enable the following language servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local nvim_lsp require "lspconfig"
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  --   ['<Tab>'] = function(fallback)
  --     if cmp.visible() then
  --       cmp.select_next_item()
  --     elseif luasnip.expand_or_jumpable() then
  --       vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
  --     else
  --       fallback()
  --     end
  --   end,
  --   ['<S-Tab>'] = function(fallback)
  --     if cmp.visible() then
  --       cmp.select_prev_item()
  --     elseif luasnip.jumpable(-1) then
  --       vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-jump-prev', true, true, true), '')
  --     else
  --       fallback()
  --     end
  --   end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'cmp_tabnine'},
    { name = 'calc'},
    { name = 'emoji' },
    { name = 'treesitter' },
    { name = 'orgmode' },
    { name = 'crates' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'neorg' }
  },
 documentation = {
    border = "rounded",
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
  },
  formatting = {
    format = function(entry, vim_item)
    vim_item.kind = ({
      Text = " Text",
      Method = " Method",
      Function = " Function",
      Constructor = " Constructor",
      Field = "ﰠ Field",
      Variable = " Variable",
      Class = "ﴯ Class",
      Interface = " Interface",
      Module = " Module",
      Property = "ﰠ Property",
      Unit = "塞Unit",
      Value = " Value",
      Enum = " Enum",
      Keyword = " Keyword",
      Snippet = " Snippets",
      Color = " Color",
      File = " File",
      Reference = " Reference",
      Folder = " Folder",
      EnumMember = " EnumMember",
      Constant = " Constant",
      Struct = "פּ Struct",
      Event = " AI",
      Operator = " Operator",
      TypeParameter = "",
    })[vim_item.kind]
    local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TabNine]",
	path = "[Path]",
        emoji = "[Emoji]",
        calc = "[Calc]",
        latex_symbol = "[Latex]",
    }

    local menu = source_mapping[entry.source.name]
      if entry.source.name == 'cmp_tabnine' then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. ' ' .. menu
        end
        vim_item.kind = ' ⚡️'
      end
      vim_item.menu = menu
      return vim_item
    end
   },
}
