local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
vim.o.completeopt = "menu,menuone,noselect,noinsert"

local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
		end,
	},
	mapping = {
        ['<S-k>'] = cmp.mapping.scroll_docs(-4),
        ['<S-j>'] = cmp.mapping.scroll_docs(4),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<S-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<S-w>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = "vsnip" },
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
			if entry.source.name == "cmp_tabnine" then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. " " .. menu
				end
				vim_item.kind = "  AI"
			end
			vim_item.menu = menu
			return vim_item
		end,
	},
})

vim.cmd([[
    augroup NvimCmp
    au!
    au FileType TelescopePrompt lua require('cmp').setup.buffer { enabled = false }
    augroup END
]])
