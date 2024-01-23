local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)
require("psyorange")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
plugins = {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                              , branch = '0.1.x',
		dependencies = { 'nvim-lua/plenary.nvim' ,
		'BurntSushi/ripgrep',
		'sharkdp/fd'

	}
},
{
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v2.x',
	dependencies = {
		-- LSP Support
		{'neovim/nvim-lspconfig'},             -- Required
		{'williamboman/mason.nvim'},           -- Optional
		{'williamboman/mason-lspconfig.nvim'}, -- Optional

		-- Autocompletion
		{'hrsh7th/nvim-cmp'},     -- Required
		{'hrsh7th/cmp-nvim-lsp'}, -- Required
		{'L3MON4D3/LuaSnip'},     -- Required
	}
},
{
	'ThePrimeagen/vim-be-good'
},
{
	'mcchrish/zenbones.nvim',
	dependencies = { 'rktjmp/lush.nvim' }
},
{
	'https://github.com/aktersnurra/no-clown-fiesta.nvim'
},

{
	'nvim-treesitter/nvim-treesitter'
},{
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	keys = {
		{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
	},
}
}
-- CONFIG
-- no clown fiesta
require("no-clown-fiesta").setup({
	transparent = false, -- Enable this to disable the bg color
	styles = {
		-- You can set any of the style values specified for `:h nvim_set_hl`
		comments = {},
		keywords = {},
		functions = {},
		variables = {},
		type = { bold = true },
		lsp = { underline = true }
	},
})
-- lazy
require("lazy").setup(plugins,opts)

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({search = vim.fn.input("Grep > ")})
end)
-- lsp-zero
local lsp = require('lsp-zero').preset({})

lsp.preset("recommended")
-- (Optional) Configure lua language server for neovim
--require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
end)
lsp.setup()
-- options
vim.opt.nu = true;
vim.opt.relativenumber = true;
vim.opt.tabstop = 4;
vim.opt.shiftwidth = 4;
vim.opt.softtabstop = 4;
vim.opt.autochdir = true;
vim.opt.smartindent = true;
vim.opt.wrap = false;
vim.opt.hlsearch = false;
vim.opt.incsearch = true
vim.opt.termguicolors = true;
vim.opt.scrolloff = 8;
vim.opt.updatetime = 50;
vim.opt.background = dark;
vim.opt.clipboard = "unnamedplus"
-- cmd options
vim.cmd [[set background=dark]]
vim.cmd [[colorscheme no-clown-fiesta]]
-- remaps
vim.g.mapleader = " "
vim.keymap.set("v","J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v","K", ":m '<-2<CR>gv=gv")

local set_keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
vim.keymap.set("n","\\",":vsplit<CR>",opts);
vim.keymap.set("n","-",":split<CR>",opts);
-- Map '\' for vertical split
--set_keymap('n', '\\', ':vsplit<CR>', opts)

-- Map '-' for horizontal split
--set_keymap('n', '-', ':split<CR>', opts)
