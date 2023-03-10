require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"sumneko_lua",
		"rust_analyzer",
		"angularls",
		"bashls",
		"dockerls",
		"html",
		"jsonls",
		"quick_lint_js",
		"tsserver",
		"sqlls",
		"tailwindcss",
		"volar",
	},
})

require("lspconfig").sumneko_lua.setup({})
require("lspconfig").angularls.setup({})
require("lspconfig").bashls.setup({})
require("lspconfig").dockerls.setup({})
require("lspconfig").html.setup({})
require("lspconfig").jsonls.setup({})
require("lspconfig").quick_lint_js.setup({})
require("lspconfig").tsserver.setup({})
require("lspconfig").tailwindcss.setup({})
require("lspconfig").volar.setup({})
require("lspconfig").prettierd.setup({})

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require("lspconfig").cssls.setup({
	capabilities = capabilities,
})
