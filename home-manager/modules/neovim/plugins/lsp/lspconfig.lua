local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local on_attach = function(_, bufnr)
	local bufmap = function(keys, func)
		vim.keymap.set("n", keys, func, { buffer = bufnr })
	end

	bufmap("<leader>r", vim.lsp.buf.rename)
	bufmap("<leader>A", vim.lsp.buf.code_action)
	bufmap("<leader>D", vim.lsp.buf.type_definition)

	bufmap("gd", vim.lsp.buf.definition)
	bufmap("gD", vim.lsp.buf.declaration)
	bufmap("gI", vim.lsp.buf.implementation)

	bufmap("gr", require("telescope.builtin").lsp_references)
	bufmap("<leader>s", require("telescope.builtin").lsp_document_symbols)
	bufmap("<leader>S", require("telescope.builtin").lsp_dynamic_workspace_symbols)

	bufmap("K", vim.lsp.buf.hover)

	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, {})

	vim.diagnostic.config({
		virtual_text = true,
	})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- nil
lspconfig.nil_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		nix = {
			flake = {
				autoArchive = true,
			},
		},
	},
})

-- lua-language-server
lspconfig.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- bash-language-server
lspconfig.bashls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- clang-tools
lspconfig.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- pyright
lspconfig.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- vscode-langservers-extracted
lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.eslint.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- htmx-lsp
lspconfig.htmx.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- tailwindcss-language-server
lspconfig.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- typescript-language-server
lspconfig.ts_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- svelte-language-server
lspconfig.svelte.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- marksman
lspconfig.marksman.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- ERROR: have error if word starting with dollar symbol
-- emmet-ls
-- lspconfig.emmet_ls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

-- emmet-language-server
lspconfig.emmet_language_server.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- gdtoolkit_4
lspconfig.gdscript.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
lspconfig.gdshader_lsp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- omnisharp-roslyn
lspconfig.omnisharp.setup({
	cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
	on_attach = on_attach,
	capabilities = capabilities,
})

-- cmake-language-server
lspconfig.neocmake.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
