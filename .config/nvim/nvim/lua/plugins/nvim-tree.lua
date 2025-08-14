return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        -- disable netrw at the very start of your init.lua
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 30,
                relativenumber = true
            },
            renderer = {
                indent_markers = {
                    enable = true
                },
                group_empty = true,
                icons = {
                    show = {
                        file = true,
                        folder = true
                    }
                }
            },
            actions = {
                open_file = {
                    window_picker = {
                        enable = true
                    }
                },
            },
            filters = {
                dotfiles = true,
            },
        })
    end
}
