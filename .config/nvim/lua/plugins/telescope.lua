return {
    {
        -- Telescope core plugin
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',                           -- Required dependency
            'https://github.com/princejoogie/dir-telescope.nvim', -- Additional plugin
        },
        config = function()
            require('telescope').setup {
                defaults = {
                    -- Display paths as: filename first, then shortened
                    path_display = { 'filename_first', shorten = 5 },
                },
                pickers = {
                    -- Git files picker
                    git_files = {
                        theme = "dropdown",
                        previewer = false,
                    },
                    -- Normal file finder
                    find_files = {
                        theme = "dropdown",
                        previewer = false,
                    },
                    -- Live grep picker (like "grep -r")
                    live_grep = {
                        theme = 'ivy',
                    },
                    -- LSP references picker with bigger vertical layout
                    lsp_references = {
                        layout_strategy = 'horizontal',
                        layout_config = {
                            width = 0.75,
                            preview_width = 0.5,
                        },
                    },
                    -- Quickfix picker
                    quickfix = {
                        theme = 'ivy',
                    },
                },
            }

            local builtin = require('telescope.builtin')

            -- Check if current directory is inside a git repository
            local function is_git_project()
                local handle = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
                local result = handle:read("*a")
                handle:close()
                return result:match("true") ~= nil
            end

            -- Map `<leader>f` to either git_files or find_files depending on project type
            if is_git_project() then
                vim.keymap.set('n', '<leader>f', builtin.git_files)
            else
                vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
            end

            vim.keymap.set('n', '<leader>q', builtin.quickfix, { desc = 'Telescope quickfix' })
            vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live grep' })

            vim.keymap.set('n', '<leader>m', function()
              builtin.lsp_document_symbols({
                layout_strategy = 'horizontal',
                layout_config = { width = 0.6, height = 0.6 },
              })
            end, { noremap = true, silent = true, desc = "Telescope: Functions in current file" })
            
            vim.keymap.set('n', '<leader>o', function()
              builtin.lsp_workspace_symbols({
                layout_strategy = 'horizontal',
                layout_config = { width = 0.7, height = 0.7 },
              })
            end, { noremap = true, silent = true, desc = "Telescope: All functions in workspace" })
            
        end,
    },
}
