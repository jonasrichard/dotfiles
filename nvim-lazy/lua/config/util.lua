function SplitVisualSelection()
  -- A kijelölés sorainak lekérése
  local start_row = vim.fn.line("'<")
  local end_row = vim.fn.line("'>")
  local lines = vim.api.nvim_buf_get_lines(0, start_row - 1, end_row, false)

  -- A sorok összefűzése egyetlen szöveggé
  local text = table.concat(lines, " ")

  -- A szöveg szavakra bontása
  local words = {}
  for word in text:gmatch("%S+") do
    table.insert(words, word)
  end

  -- A szöveg újraformázása
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

  -- Az utolsó sor hozzáadása
  table.insert(new_lines, current_line)

  -- A kijelölt sorok törlése és az új sorok beillesztése
  vim.api.nvim_buf_set_lines(0, start_row - 1, end_row, false, new_lines)
end

function WordWrap()
  local mode = vim.fn.mode()

  print(mode)
end

--vim.api.nvim_set_keymap("v", "<leader>aw", ":lua WordWrap()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "<leader>aw", ":lua SplitVisualSelection()<CR>", {
  noremap = true,
  silent = true,
  desc = "Word wrap selection",
})
