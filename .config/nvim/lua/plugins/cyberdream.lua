return {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000, -- ensure it loads before other colorschemes

    config = function()
        -- Setup cyberdream theme with customization
        require('cyberdream').setup({
            variant = "default",
            transparent = false,      -- disables setting background color
            italic_comments = true,   -- enable italic for comments
            hide_fillchars = true,    -- hide fillchars for empty space
        })

    end
}
