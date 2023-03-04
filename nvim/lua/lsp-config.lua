local lspconfig = require('lspconfig')

lspconfig.gopls.setup({
	cmd = {"gopls"},
	filetypes = {"go", "gomod"},
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})

