return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        
        local batman_theme = {
	    normal = {
		a = { fg = '#000000', bg = '#FFD500', gui = 'bold' }, -- yellow bg, black fg (bat signal colors)
		b = { fg = '#FFD500', bg = '#1C1C1C' },
		c = { fg = '#FFFFFF', bg = '#1C1C1C' },
	    },
	    insert = {
		a = { fg = '#000000', bg = '#3A7CA5', gui = 'bold' }, -- blue for insert mode
		b = { fg = '#FFD500', bg = '#1C1C1C' },
		c = { fg = '#FFFFFF', bg = '#1C1C1C' },
	    },
	    visual = {
		a = { fg = '#000000', bg = '#FFAA00', gui = 'bold' }, -- orange for visual mode
		b = { fg = '#FFD500', bg = '#1C1C1C' },
		c = { fg = '#FFFFFF', bg = '#1C1C1C' },
	    },
	    replace = {
		a = { fg = '#000000', bg = '#D72631', gui = 'bold' }, -- red for replace mode
		b = { fg = '#FFD500', bg = '#1C1C1C' },
		c = { fg = '#FFFFFF', bg = '#1C1C1C' },
	    },
	    command = {
		a = { fg = '#000000', bg = '#FFD500', gui = 'bold' },
		b = { fg = '#FFD500', bg = '#1C1C1C' },
		c = { fg = '#FFFFFF', bg = '#1C1C1C' },
	    },
	    inactive = {
                a = { fg = '#AAAAAA', bg = '#222222', gui = 'bold' },
                b = { fg = '#AAAAAA', bg = '#222222' },
                c = { fg = '#CCCCCC', bg = '#222222' },
	    },
	}

        require('lualine').setup {

            options = {
                theme = batman_theme,
                globalstatus = false,
                disabled_filetypes = { 'NvimTree', 'packer', 'dashboard' },
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff', 'diagnostics' },
                lualine_c = { 'filename' },
                lualine_x = { 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            }
        }
    end
}
