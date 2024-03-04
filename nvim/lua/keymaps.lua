-- Modules map to leader key
vim.g.mapleader = ','

vim.keymap.set('n', '<Leader>n', '<Cmd>NvimTreeToggle<cr>')
vim.keymap.set('n', '<Leader>o', '<Cmd>AerialToggle<cr>')

vim.keymap.set('n', '<F2>', '<Cmd>bp|bd #<CR>')
vim.keymap.set('n', '<F3>', '<Cmd>bprevious<CR>')
vim.keymap.set('n', '<F4>', '<Cmd>bnext<CR>')
vim.keymap.set('n', '<F5>', '<Cmd>Rg <c-r><c-w><CR>')
-- Close Quickfix window
vim.keymap.set('n', '<Leader>c', '<Cmd>cclose<CR>')

vim.keymap.set('n', '<Leader>w', '<Cmd>w<CR>')

-- Move between windows
vim.keymap.set('n', '<Leader>h', '<c-w>h')
vim.keymap.set('n', '<Leader>j', '<c-w>j')
vim.keymap.set('n', '<Leader>k', '<c-w>k')
vim.keymap.set('n', '<Leader>l', '<c-w>l')

-- Resize windows
vim.keymap.set('n', '<up>', '<Cmd>resize -5<CR>')
vim.keymap.set('n', '<down>', '<Cmd>resize +5<CR>')
vim.keymap.set('n', '<left>', '<Cmd>vertical resize +5<CR>')
vim.keymap.set('n', '<right>', '<Cmd>vertical resize -5<CR>')

vim.keymap.set('v', '<Leader>y', '"*y')
-- Replace without spoiling the yank buffer
vim.keymap.set('x', '<Leader>p', '\"_dP')
vim.keymap.set('n', '<Leader>yl', function() vim.fn.setreg('*', vim.fn.getline('.')) end)

vim.keymap.set('v', '<Leader>ue', '!python3 -c "import sys; from urllib import parse; print(parse.quote_plus(sys.stdin.read().strip()))"<cr>')
vim.keymap.set('v', '<Leader>ud', '!python3 -c "import sys; from urllib import parse; print(parse.unquote_plus(sys.stdin.read().strip()))"<cr>')
