require("config.lazy")

-- Theme
vim.cmd("colorscheme kanagawa")

-- settings options 
-- Use true color support for better highlighting
vim.opt.termguicolors = true

-- Vim like settings
vim.cmd("syntax on")
vim.cmd("silent !kitty @ set-colors --reset")  -- Sync colors with Kitty
vim.cmd("let g:netrw_liststyle = 3")

-- Ensure Neovim respects 256 colors
vim.env.TERM = "xterm-256color"
vim.env.COLORTERM = "truecolor"

-- General settings
vim.opt.backspace       = { "indent", "eol", "start" }  -- Allow backspacing over everything in insert mode
vim.opt.autoindent      = true                          -- Keep indentation from previous line
vim.opt.display         = "lastline"                    -- Show as much of the line as possible
vim.opt.wildmenu        = true                          -- Better command-line completion
vim.opt.showcmd         = true                          -- Show incomplete commands in the bottom-right
vim.opt.number          = true                          -- Show absolute line numbers
vim.opt.relativenumber  = true                          -- Show relative line numbers
vim.opt.laststatus      = 2                             -- Always show the status line
vim.opt.ruler           = true                          -- Show the cursor position
vim.opt.textwidth       = 0                             -- Disable automatic line wrapping
vim.opt.incsearch       = true                          -- Incremental search
vim.opt.scrolloff       = 5                             -- Keep at least 5 lines visible above/below the cursor
vim.opt.wrap            = false                         -- Disable line wrapping
vim.opt.cursorline      = true                          -- Highlight the current cursor line
vim.opt.fileformat      = "unix"                        -- Use Unix file format
vim.opt.signcolumn      = "yes"                         -- Always show the sign column

-- Indentation
vim.opt.shiftwidth      = 4                             -- Indent using 4 spaces
vim.opt.softtabstop     = 4                             -- Match shiftwidth for better alignment
vim.opt.expandtab       = true                          -- Use spaces instead of tabs

-- Search
vim.opt.ignorecase      = true                          -- Ignore case in search
vim.opt.smartcase       = true                          -- Override ignorecase if search contains uppercase

-- System clipboard integration (y+, p+, etc.)
vim.opt.clipboard       = "unnamedplus"

-- Optional: Shortcuts for easier system clipboard usage (not strictly needed if using y+ and p+)
-- These keymaps make y and p also default to system clipboard
vim.keymap.set("n", "<C-y>", '"+y', { noremap = true, silent = true })
vim.keymap.set("v", "<C-y>", '"+y', { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", '"+p', { noremap = true, silent = true })
vim.keymap.set("v", "<C-p>", '"+p', { noremap = true, silent = true })
vim.keymap.set("i", "jk", "<ESC>", {desc = "Exit insert mode with jk"})

-- Window Management
vim.keymap.set("n", "<leader>sv", "<C-w>v")
vim.keymap.set("n", "<leader>sh", "<C-w>s")
vim.keymap.set("n", "<leader>se", "<C-w>=")
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>")
-- Moving between splits (changing focus):
-- Ctrl-w h → move to the left split
-- Ctrl-w j → move to the below split
-- Ctrl-w k → move to the above split
-- Ctrl-w l → move to the right split
-- Maximize the height of the current split: Ctrl-w _
-- Maximize the width of the current split: Ctrl-w |
-- Close all other windows except current: :only

-- Tab management
-- Tab management keymaps in Lua

-- Open a new tab
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = 'Open a new tab' })
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>', { desc = 'Go to previous tab' })
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<leader>ts', ':tabfirst<CR>', { desc = 'Go to first tab' })
vim.keymap.set('n', '<leader>tf', ':tabnew %<CR>', { desc = 'Open current file in new tab' })

--  Remove octal number support
vim.opt.nrformats:remove("octal")

-- Keymappings
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>')
vim.keymap.set('n', '<C-s>', '<Esc>:w<CR>')
vim.keymap.set('i', 'QQ', '<Esc>:q<CR>')
vim.keymap.set('n', 'QQ', '<Esc>:q<CR>')

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})
