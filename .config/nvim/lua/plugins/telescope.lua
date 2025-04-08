return {
  {
	'nvim-telescope/telescope.nvim',
	dependencies = {
	  'nvim-lua/plenary.nvim',
	  'https://github.com/princejoogie/dir-telescope.nvim'
	},
	config = function ()
	  require('telescope').setup {
		defaults = {
		  path_display = {'filename_first', shorten = 5},
		},
		pickers = {
		  git_files = {
			theme = "dropdown",
			previewer = false
		  },
		  find_files = {
			theme = "dropdown",
			previewer = false
		  },
		  live_grep = {
			theme = 'ivy'
		  },
		  lsp_references = {
			theme = 'cursor',
		  },
		  quickfix = {
			theme = 'ivy'
		  }
		},
	  }
	  local builtin = require('telescope.builtin')
	  -- -- file search
	  local function is_git_project()
		local handle = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
		local result = handle:read("*a")
		handle:close()
		return result:match("true") ~= nil
	  end
	  if is_git_project() then
		vim.keymap.set('n', '<leader>f', builtin.git_files)
	  else
		vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope find files' })
	  end
	  -- find references
-- LSP-related keymaps using vim.keymap.set directly
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { noremap = true, silent = true, desc = "LSP: Go to definition" })
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { noremap = true, silent = true, desc = "LSP: Find references" })
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { noremap = true, silent = true, desc = "LSP: Go to implementation" })
vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", { noremap = true, silent = true, desc = "LSP: Type definition" })

vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true, desc = "LSP: Hover documentation" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = true, desc = "LSP: Rename symbol" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true, desc = "LSP: Code action" })

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true, desc = "LSP: Show diagnostics" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "LSP: Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "LSP: Next diagnostic" })

vim.keymap.set("n", "<leader>kd", function()
  vim.lsp.buf.format { async = true }
end, { noremap = true, silent = true, desc = "LSP: Format file" })

	  -- quick fix
	  vim.keymap.set('n', '<leader>q', builtin.quickfix , { desc = 'Telescope quickfix' })

	  -- grep
	  vim.keymap.set('n', '<leader>g', builtin.live_grep)
  end
}
}
