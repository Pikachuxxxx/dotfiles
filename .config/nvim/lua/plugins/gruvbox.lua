return {
    "ellisonleao/gruvbox.nvim", -- The plugin for the Gruvbox colorscheme
    priority = 1000, -- Load this plugin first so the colorscheme is applied early

    config = function()
        -- Setup Gruvbox with your preferred options
        require("gruvbox").setup({
            terminal_colors = true, -- Enable Gruvbox colors in the built-in terminal
            undercurl = true,       -- Enable undercurls (curved underlines for spelling mistakes, etc.)
            underline = true,       -- Enable regular underlines
            bold = true,            -- Enable bold text styling

            italic = {              -- Fine-grained control over italic styling:
                strings = true,     -- Italicize strings (like "text")
                emphasis = true,    -- Italicize emphasized text (like markdown `*emphasis*`)
                comments = true,    -- Italicize comments in code
                operators = true,   -- Italicize operators (like +, -, etc.)
                folds = true,       -- Italicize folded text lines
            },

            strikethrough = true,   -- Enable strikethrough text styling
            invert_selection = false, -- Don’t invert selection highlight colors
            invert_signs = false,     -- Don’t invert sign column colors (like for git diff markers)
            invert_tabline = false,   -- Don’t invert tabline colors
            inverse = true,           -- Invert background for search, diffs, statuslines, and errors (enhances contrast!)

            contrast = "", -- Overall contrast level: "hard", "soft", or "" (default). "" keeps it neutral

            palette_overrides = {}, -- If you want to override specific colors, put them here
            overrides = {},         -- If you want to override specific highlight groups, put them here

            dim_inactive = false,   -- Don’t dim inactive windows (so all windows have full brightness)
            transparent_mode = false, -- Don’t enable transparent background (set to true if you want to see the terminal’s background)
        })
    end
}
