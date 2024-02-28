require('nvim-web-devicons').setup({})

require('nvim-tree').setup({
    hijack_cursor = false,
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        show_on_open_dirs = true,
    }
})
