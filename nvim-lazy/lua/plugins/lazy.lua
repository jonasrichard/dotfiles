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
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        follow_current_file = {
          enabled = false,
          leave_dirs_open = false,
        },
      },
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
