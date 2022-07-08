-- LSP autocomplete
vim.opt.completeopt={"menu", "menuone", "noselect"} -- setting vim values\
vim.g.completion_matching_strategy_list={'exact', 'substring', 'fuzzy'}

local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	path = "[Path]",
}

local lspkind = require("lspkind")

cmp.setup({
  snippet = {
		expand = function(args)
			-- For `vsnip` user.
			-- vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` user.
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},

	mapping = {
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
    ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item()), 
    ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item()),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},

	formatting = {
		format = function(entry, vim_item)
			vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			vim_item.menu = menu
			return vim_item
		end,
	},

	sources = {
		-- tabnine completion? yayaya

		-- { name = "cmp_tabnine" },

		{ name = "nvim_lsp" },

		-- For vsnip user.
		-- { name = 'vsnip' },

		-- For luasnip user.
		{ name = "luasnip" },

		-- For ultisnips user.
		-- { name = 'ultisnips' },

		-- { name = "buffer" },
	},
})

-- config lsp
local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
			Nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
			Nnoremap("gt", ":lua vim.lsp.buf.type_definition()<CR>")
			Nnoremap("gi", ":lua vim.lsp.buf.implementation()<CR>")
			Nnoremap("[d", ":lua vim.diagnostic.goto_next()<CR>")
			Nnoremap("]d", ":lua vim.diagnostic.goto_prev()<CR>")
			Nnoremap("<leader>f", ":lua vim.lsp.buf.formatting()<CR>")
			Nnoremap("<leader>dl", ":Telescope diagnostics<CR>")
			Nnoremap("<leader>rn", ":lua vim.lsp.buf.rename()<CR>")
			Nnoremap("<leader>ca", ":lua vim.lsp.buf.code_action()<CR>")
			Nnoremap("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
			Nnoremap("<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
		end,
	}, _config or {})
end

local opts = {
    tools = { -- rust-tools options
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
}


require('lspconfig').tsserver.setup(config())
require('lspconfig').cssls.setup(config())
require('lspconfig').jsonls.setup(config())

require("lspconfig").rust_analyzer.setup(config({	
  cmd = { "rust-analyzer" },
}))

require("luasnip.loaders.from_vscode").lazy_load()
require("cmp_luasnip")


