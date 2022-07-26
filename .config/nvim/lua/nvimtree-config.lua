require'nvim-tree'.setup {
    update_focused_file = {
        enable      = true,
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 400,
    },
    filters = {
        custom = {
            "^\\.git$"
        }
    },
--    highlight_focused_file = true,
}
