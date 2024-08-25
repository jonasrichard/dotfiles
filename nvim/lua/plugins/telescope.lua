local builtin = require('telescope.builtin')

vim.keymap.set('n', '<Leader>sf',
    function() builtin.find_files({file_ignore_patterns = {'vendor'}}) end,
    { desc = '[S]earch [F]iles'}
)
vim.keymap.set('n', '<Leader>sg',
    function() builtin.live_grep({file_ignore_patterns = {'vendor'}}) end,
    { desc = '[S]earch with [G]rep' }
)
vim.keymap.set('n', '<Leader>sr', builtin.lsp_references,
    { desc = '[S]earch [R]eferences' }
)
vim.keymap.set('n', '<Leader>ss', builtin.lsp_document_symbols,
    { desc = '[S]earch [S]ymbols' }
)
vim.keymap.set('n', '<Leader>sd', builtin.diagnostics,
    { desc = '[S]earch [D]iagnostics' }
)
vim.keymap.set('n', '<Leader>sh', builtin.help_tags,
    { desc = '[S]earch [H]elp' }
)

vim.keymap.set('n', '<Leader>sn', function() builtin.find_files({ cwd = vim.fn.stdpath('config') }) end,
    { desc = '[S]earch [N]eovim files' }
)
