local function on_attach(client, buffer)
	local opts = {buffer = buffer, remap = false}

    -- keymaps come here
end

vim.g.rustaceanvim = {
    -- Plugin configuration
	tools = {
		runnables = {
			use_telescope = true,
		},
		inlay_hints = {
			auto = true,
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
	},

    server = {
        on_attach = on_attach,

        settings = {
            -- config rust-analyzer
            ['rust-analyzer'] = {
				-- enable clippy on save
				checkOnSave = {
					command = "clippy",
				},
            },
        },
    },

    dap = {
    },
}

require("rustaceanvim")

-- Rust autocommands
vim.api.nvim_create_augroup("Rust", {})

-- Format Rust files on save
vim.api.nvim_create_autocmd({"BufWritePre"}, {
    group = "Rust",
    pattern = {"*.rs"},
    callback = function(ev)
        vim.lsp.buf.format()
    end
})
