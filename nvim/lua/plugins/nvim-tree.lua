require('nvim-web-devicons').setup({})

require('nvim-tree').setup({
    git = {
        show_on_dirs = false,
        show_on_open_dirs = false,
    },
    hijack_cursor = false,
    renderer = {
        indent_markers = {
            enable = true,
        },
        special_files = {},
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        show_on_open_dirs = false,
    }
})
