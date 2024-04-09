local emmet = require("nvim-emmet")

vim.keymap.set({'n', 'v'}, '<Leader>xe', emmet.wrap_with_abbreviation)
