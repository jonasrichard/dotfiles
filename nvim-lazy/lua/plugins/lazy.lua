return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
  -- Disable incremental search for 's'
  {
    "folke/flash.nvim",
    keys = {
      { "s", mode = { "n", "x", "o", "v" }, false },
    },
  },
  {
    "snacks.nvim",
    opts = {
      indent = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
    },
  },
}
