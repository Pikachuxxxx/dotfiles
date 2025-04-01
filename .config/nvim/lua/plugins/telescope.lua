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
	  vim.keymap.set('n', 'gd', builtin.lsp_references , { desc = 'Telescope get references for word under cursor' })
	  -- quick fix
	  vim.keymap.set('n', '<leader>q', builtin.quickfix , { desc = 'Telescope quickfix' })

	  -- grep
	  vim.keymap.set('n', '<leader>g', builtin.live_grep)
  end
}
}
