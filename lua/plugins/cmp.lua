--local has_words_before = function()
--  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
--end
--
--local feedkey = function(key, mode)
--  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
--end
-- -- Setup nvim-cmp.
-- lspconfig = require "lspconfig"
--  local cmp = require'cmp'
--  local lspkind = require('lspkind')
--  local util = require 'lspconfig/util'
--
--  cmp.setup({
--    snippet = {
--      expand = function(args)
--        -- For `vsnip` user.
--        vim.fn["vsnip#anonymous"](args.body)
--
--        -- For `luasnip` user.
--        -- require('luasnip').lsp_expand(args.body)
--
--        -- For `ultisnips` user.
--        -- vim.fn["UltiSnips#Anon"](args.body)
--      end,
--    },
--    mapping = {
--      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--      ['<C-f>'] = cmp.mapping.scroll_docs(4),
--      ['<C-Space>'] = cmp.mapping.complete(),
--      ['<C-e>'] = cmp.mapping.close(),
--      ['<CR>'] = cmp.mapping.confirm({ select = true }),
--      ["<Tab>"] = cmp.mapping(function(fallback)
--        if cmp.visible() then
--          cmp.select_next_item()
--        elseif vim.fn["vsnip#available"]() == 1 then
--          feedkey("<Plug>(vsnip-expand-or-jump)", "")
--        elseif has_words_before() then
--          cmp.complete()
--        else
--          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
--        end
--      end, { "i", "s" }),
--
--      ["<S-Tab>"] = cmp.mapping(function()
--        if cmp.visible() then
--          cmp.select_prev_item()
--        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
--          feedkey("<Plug>(vsnip-jump-prev)", "")
--        end
--      end, { "i", "s" }),
--    },
--    sources = {
--      { name = 'nvim_lsp' },
--
--      -- For vsnip user.
--      { name = 'vsnip' },
--
--      -- For luasnip user.
--      -- { nae = 'luasnip' },
--
--      -- For ultisnips user.
--      -- { name = 'ultisnips' },
--
--      { name = 'buffer' },
--      { name = 'omni'}, 
--    },
--    formatting = {
--    format = lspkind.cmp_format({with_text = false, maxwidth = 50})
--  }
--  })
--local on_attach_vim = function()
--	document_highlight()
--end
--  -- Setup lspconfig.
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
--lspconfig.gopls.setup {
--  capabilities = capabilities,
--  cmd = { "gopls"},
--  filetypes = { "go", "gomod" },
--  root_dir = util.root_pattern("go.mod", ".git")
--}


local present, cmp = pcall(require, "cmp")

if not present then
   return
end

vim.opt.completeopt = "menuone,noselect"

-- nvim-cmp setup
cmp.setup {
   snippet = {
      expand = function(args)
         require("luasnip").lsp_expand(args.body)
      end,
   },
   formatting = {
      format = function(entry, vim_item)
         vim_item.menu = ({
	    buffer = "Buffer",
	    nvim_lsp = "LSP",
	    nvim_lua = "Lua",
	    Path = "Path",
	    luasnip = "LuaSnip",
	    orgmode = "Org",
         })[entry.source.name]
         vim_item.kind = ({
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "ﰠ",
            Variable = "",
            Class = "ﴯ",
            Interface = "",
            Module = "",
            Property = "ﰠ",
            Unit = "塞",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "פּ",
            Event = "",
            Operator = "",
            TypeParameter = "",
         })[vim_item.kind]
         return vim_item
      end,
   },
   mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm {
         behavior = cmp.ConfirmBehavior.Replace,
         select = true,
      },
      ["<Tab>"] = function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
         else
            fallback()
         end
      end,
      ["<S-Tab>"] = function(fallback)
         if cmp.visible() then
             cmp.select_prev_item()
         elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
         else
            fallback()
         end
      end,
   },
   sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "orgmode" },
      { name = "cmp_tabnine" },
   },
}
