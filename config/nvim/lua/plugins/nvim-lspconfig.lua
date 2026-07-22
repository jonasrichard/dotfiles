--vim.diagnostic.config({
--  virtual_text = false,
--})

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },

      pyright = {},

      rust_analyzer = {},
    },
  },
}
