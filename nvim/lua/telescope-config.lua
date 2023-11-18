local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Leader>sf', function() builtin.find_files({file_ignore_patterns = {"vendor"}}) end, {})
vim.keymap.set('n', '<Leader>sg', function() builtin.live_grep({file_ignore_patterns = {"vendor"}}) end, {})
vim.keymap.set('n', '<Leader>sr', builtin.lsp_references, {})
