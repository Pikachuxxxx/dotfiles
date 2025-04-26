require("config.lazy")

-- Theme
vim.cmd("colorscheme kanagawa")

-- settings options 
-- Use true color support for better highlighting
vim.opt.termguicolors = true

-- Vim like settings
vim.cmd("syntax on")
vim.cmd("silent !kitty @ set-colors --reset")  -- Sync colors with Kitty

-- Ensure Neovim respects 256 colors
vim.env.TERM = "xterm-256color"
vim.env.COLORTERM = "truecolor"

-- General settings
vim.opt.backspace = "indent,eol,start"  -- Allow backspacing over everything in insert mode
vim.opt.autoindent = true               -- Keep indentation from previous line
vim.opt.display = "lastline"            -- Show as much of the line as possible
vim.opt.wildmenu = true                 -- Enable better command-line completion
vim.opt.showcmd = true                  -- Show incomplete commands in the bottom-right
vim.opt.number = true                    -- Show line numbers
vim.opt.laststatus = 2                   -- Always show the status line
vim.opt.ruler = true                     -- Show the cursor position
vim.opt.textwidth = 0                     -- Disable automatic line wrapping
vim.opt.incsearch = true                 -- Show search matches as you type
vim.opt.scrolloff = 5                     -- Keep at least 5 lines visible above/below the cursor
vim.opt.wrap = false                      -- Disable line wrapping

-- Indentation settings
vim.opt.tabstop = 4                       -- Make a tab character 4 spaces wide
vim.opt.shiftwidth = 4                    -- Indent using 4 spaces
vim.opt.softtabstop = 4                    -- Match shiftwidth for better alignment

-- Remove octal number support
vim.opt.nrformats:remove("octal")

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
