return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup {
            -- 🌟 A list of parser names to install (or "all")
            -- These will be ensured to be available by :TSUpdate
            ensure_installed = {
                "c",         -- C language support
                "cpp",       -- C++ language support
                "lua",       -- Lua (for Neovim config itself)
                "vim",       -- Vimscript for config files
                "python",    -- Python language support
                "rust",      -- Rust language support
                "vimdoc",    -- Help / :h documentation
                "query",     -- Treesitter's own query language
                "markdown",  -- Markdown highlighting
                "markdown_inline", -- Inline Markdown (e.g., GitHub-flavored)
            },

            -- ⏳ Install parsers synchronously (only during `:TSInstall`)
            -- If true, blocks until all are installed; typically false for faster startup
            sync_install = false,

            -- 🔄 Automatically install missing parsers when entering buffer
            -- If you don't have `tree-sitter` CLI installed locally, set this to false.
            -- When true, opening a filetype auto-triggers installation of missing parser.
            auto_install = true,

            -- 🚫 List of parsers to ignore installing (can also be "all")
            ignore_install = { "javascript" }, -- Example: skip JS parser

            -- 📝 Indentation support (experimental, but very helpful for structured languages!)
            indent = { enable = true },

            -- 🎨 Highlighting
            highlight = {
                enable = true, -- Enables Treesitter-based highlighting

                -- 🔧 Disable highlighting for large files (improves performance)
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true -- disable highlighting for this buffer
                    end
                end,

                -- 📝 Additional Vim regex-based highlighting
                -- When true, uses legacy `:syntax` + Treesitter (can be slow)
                -- Typically false to avoid duplicate highlights
                additional_vim_regex_highlighting = false,
            },
        }
    end,
}
