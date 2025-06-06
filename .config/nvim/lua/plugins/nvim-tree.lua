return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {
                "nvim-tree/nvim-web-devicons"
        },
        config = function()
            -- disable netrw at the very start of your init.lua
            vim.g.loaded_netrw = 1
            vim.g.loaded_netrwPlugin = 1

            -- optionally enable 24-bit colour
            vim.opt.termguicolors = true

            -- IDE --
            vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>")

            -- OR setup with some options
            require("nvim-tree").setup({
                sort = {
                sorter = "case_sensitive",
                },
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                    icons = {
                        show = {
                            file = true,
                            folder = true
                        }
                    }
                },
                filters = {
                    dotfiles = true,
                },
            })
        end
    }
}
