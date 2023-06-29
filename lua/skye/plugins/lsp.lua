local servers = {

	"lua_ls",     --lua
	"rust_analyzer", --rust
	"eslint",     -- javascript
	"dockerls",   --docker
	"gopls",      --go
	"pyright",    -- py
	"jdtls",      --java
	"html",       --html
	"unocss",     --css
	"vimls",	  --vim
	"svelte",	  --svelte     
	"intelephense", --php
    "omnisharp" --c#
}

require('mason').setup()
require("mason-lspconfig").setup {
	ensure_installed = servers
}

require("lspsaga").setup({})

vim.keymap.set('n', '<leader>d', "<cmd>Lspsaga show_line_diagnostics<CR>")
vim.keymap.set('n', '[d', "<cmd>Lspsaga diagnostic_jump_prev<CR>")
vim.keymap.set('n', ']d', "<cmd>Lspsaga diagnostic_jump_next<CR>")
vim.keymap.set('n', '<leader>D', "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Diagnostic jump with filters such as only jumping to an error
vim.keymap.set("n", "[E", function()
	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end)
vim.keymap.set("n", "]E", function()
	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end)

local lspconfig = require("lspconfig")
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		-- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local lpts = { buffer = ev.buf }
		vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
		vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
		vim.keymap.set('n', 'gd', "<cmd>Lspsaga goto_definition<CR>")
		vim.keymap.set('n', 'K', "<cmd>Lspsaga hover_doc<CR>")
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set({ 'n', 'v' }, '<leader>ca', "<cmd>Lspsaga code_action<CR>")
		vim.keymap.set('n', 'gt', "<cmd>Lspsaga goto_type_definition<CR>")
		vim.keymap.set('n', 'gr', "<cmd>Lspsaga rename<CR>")
		vim.keymap.set('n', '<leader>fr', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

-- cmp

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()
-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup {
		-- on_attach = my_custom_on_attach,
		capabilities = capabilities,
	}
end

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
		['<C-d>'] = cmp.mapping.scroll_docs(4), -- Down
		-- C-b (back) C-f (forward) for snippet placeholder navigation.
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
}
