return{
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
        vim.api.nvim_create_autocmd("BufDelete", {
            callback = function()
                local layout = vim.fn.winlayout()
                if layout[1] == "leaf" and vim.bo.filetype == "NvimTree" then
                    vim.cmd("NvimTreeToggle")
                end
            end
        })
        require("bufferline").setup({
            options = {
                mode = "buffers",
                numbers = "ordinal",  -- add tab numbers
                separator_style = "slant",
                always_show_bufferline = true,
                show_buffer_icons = true,
                show_buffer_close_icons = true,
                show_close_icon = true,
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(_, _, diag)
                    local icons = { Error = " ", Warn = " ", Hint = " ", Info = " " }
                    local ret = (diag.error and icons.Error .. diag.error .. " " or "")
                        .. (diag.warning and icons.Warn .. diag.warning or "")
                    return ret
                end,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        highlight = "Directory",
                        separator = true
                    }
                },
                indicator = {
                    icon = "▎",
                    style = "icon"
                },
                max_name_length = 30,
                max_prefix_length = 15,
                tab_size = 25,
                enforce_regular_tabs = true,
                hover = {
                    enabled = true,
                    delay = 200,
                    reveal = {'close'}
                },
                custom_areas = {
                    right = function()
                        return {
                            {text = "📌", fg = "#ff9e64"},
                        }
                    end,
                },
            },
        })
    end
}
