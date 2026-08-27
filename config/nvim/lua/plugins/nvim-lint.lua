return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    opts.linters_by_ft = opts.linters_by_ft or {}
    opts.linters_by_ft.go = { "golangcilint" }
    opts.linters_by_ft.sh = { "shellcheck" }

    local lint = require("lint")
    local golangcilint = lint.linters.golangcilint
    local config_arg = "--config=" .. vim.fn.stdpath("config") .. "/.golangci.yaml"

    if golangcilint and golangcilint.args and not vim.tbl_contains(golangcilint.args, config_arg) then
      table.insert(golangcilint.args, 2, config_arg)
    end

    return opts
  end,
}
