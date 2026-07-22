function SplitVisualSelection()
  -- Getting the lines of the selection
  local start_row = vim.fn.line("'<")
  local end_row = vim.fn.line("'>")
  local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)

  -- Joining the lines to a single line
  local text = table.concat(lines, " ")

  -- Break the line to words
  local words = {}
  for word in text:gmatch("%S+") do
    table.insert(words, word)
  end

  -- Reformat text
  local new_lines = {}
  local current_line = ""
  local max_length = 80

  for _, word in ipairs(words) do
    if #current_line + #word + 1 > max_length and #current_line > 0 then
      table.insert(new_lines, current_line)
      current_line = word
    else
      if #current_line > 0 then
        current_line = current_line .. " " .. word
      else
        current_line = word
      end
    end
  end

  -- Adding the last line
  table.insert(new_lines, current_line)

  -- Deleting the selected line and inserting the new wrapped lines
  vim.api.nvim_buf_set_lines(0, start_row - 1, end_row, false, new_lines)
end

local wk = require("which-key")

wk.add({
  { "<leader>r", group = "Richards shortcuts" },
})

vim.api.nvim_set_keymap("v", "<leader>rw", ":lua SplitVisualSelection()<CR>", {
  noremap = true,
  silent = true,
  desc = "Word wrap selection",
})

vim.api.nvim_set_keymap("n", "<leader>bf", ":lua vim.notify(vim.fn.expand('%'))<CR>", {
  noremap = true,
  silent = true,
  desc = "Show the path of the current buffer",
})

vim.api.nvim_set_keymap("n", "<leader>bt", ":Neotree reveal<CR>", {
  noremap = true,
  silent = true,
  desc = "Reveal buffer in neo-tree",
})
