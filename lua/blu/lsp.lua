local mason = require("mason")
local mConf = require("mason-lspconfig")
local lsp = require('lspconfig')
local cmp = require('cmp')
local luasnip = require('luasnip')

local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = cmp.setup({
	mapping = {
		['<C-p>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {"i", "s"}),

		['<C-n>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.locally_jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, {"i", "s"}),

		['<C-y>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				if luasnip.expandable() then
					luasnip.expand()
				else
					cmp.confirm({select = true,})
				end
			else
				fallback()
			end
		end),

		['<C-Space>'] = cmp.mapping.complete(),

	}
})
mason.setup()
mConf.setup( {
	ensure_installed = { "rust_analyzer", "lua_ls", "clangd", "hyprls", "ltex", "pyright", "harper_ls", "yamlls", "spectral"}
})

local on_attach = function(client, bufnr)
	local opts = {buffer = bufnr, remap = false}

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end

-- lsp config after this
lsp.lua_ls.setup {
	on_attach = on_attach
}
