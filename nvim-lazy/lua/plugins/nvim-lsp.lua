return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- pyright will be automatically installed with mason and loaded with lspconfig
      pyright = {},

      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },

      rust_analyzer = {},
    },
  },
}
