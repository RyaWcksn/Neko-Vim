local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
vim.o.completeopt = "menu,menuone,noselect,noinsert"

local check_backspace = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end

require("luasnip/loaders/from_vscode").lazy_load()

local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert {
        ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<S-w>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ["<Right>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.jumpable(1) then
                luasnip.jump(1)
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif check_backspace() then
                -- cmp.complete()
                fallback()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    sources = {
        { name = 'nvim_lsp_signature_help' },
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "cmp_tabnine" },
        { name = "calc" },
        { name = "emoji" },
        { name = "treesitter" },
        { name = "orgmode" },
        { name = "crates" },
        { name = "buffer" },
        { name = "path" },
        { name = "neorg" },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    view = {
        entries = "native" -- can be "custom", "wildmenu" or "native"
    },
    window = {
        documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
        completion = cmp.config.window.bordered(),
    },
    experimental = {
        ghost_text = true,
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
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
            --[[ local source_mapping = {
                buffer = "[Buffer]",
                nvim_lsp = "[LSP]",
                path = "[Path]",
                calc = "[Calc]",
            }
            local menu = source_mapping[entry.source.name]
            vim_item.menu = menu ]]
            vim_item.abbr = string.sub(vim_item.abbr, 1, 30)
            return vim_item
        end,
    },
    enabled = function()
        -- disable completion in comments
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("Comment")
        end
    end
})
