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
vim.keymap.set('n', '<up>', function() resize_current_window(0, -5) end)
vim.keymap.set('n', '<down>', function() resize_current_window(0, 5) end)
vim.keymap.set('n', '<left>', function() resize_current_window(-5, 0) end)
vim.keymap.set('n', '<right>', function() resize_current_window(5, 0) end)

vim.keymap.set('v', '<Leader>y', '"*y')
-- Replace without spoiling the yank buffer
vim.keymap.set('x', '<Leader>p', '\"_dP')
vim.keymap.set('n', '<Leader>yl', function() vim.fn.setreg('*', vim.fn.getline('.')) end)

-- url encode and decode
vim.keymap.set('v', '<Leader>ue', '!python3 -c "import sys; from urllib import parse; print(parse.quote_plus(sys.stdin.read().strip()))"<cr>')
vim.keymap.set('v', '<Leader>ud', '!python3 -c "import sys; from urllib import parse; print(parse.unquote_plus(sys.stdin.read().strip()))"<cr>')

function resize_current_window(hplus, vplus)
    local win_id = vim.fn.win_getid()
    local pos = vim.api.nvim_win_get_position(win_id)

    if hplus ~= 0 then
        -- horizontal sizing
        local current_width = vim.api.nvim_win_get_width(win_id)

        -- is it not the leftmost window?
        if pos[2] > 1 then
            hplus = hplus * -1
        end

        local new_width = current_width + hplus

        if new_width < 5 then
            new_width = current_width
        end

        vim.api.nvim_win_set_width(win_id, new_width)
    elseif vplus ~= 0 then
        -- vertical sizing
        local current_height = vim.api.nvim_win_get_height(win_id)

        if pos[1] > 1 then
            vplus = vplus * -1
        end

        local new_height = current_height + vplus

        if new_height < 3 then
            new_height = current_height
        end

        vim.api.nvim_win_set_height(win_id, new_height)
    end
end
