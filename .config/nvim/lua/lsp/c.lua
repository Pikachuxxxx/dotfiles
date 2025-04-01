return {
  setup = function()
	local lspconfig = require("lspconfig")
	local capabilities =  require('blink.cmp').get_lsp_capabilities()
	lspconfig.clangd.setup {
	  capabilities = capabilities,
	  cmd = { 'clangd', '--background-index', '--clang-tidy' }
	}
	vim.keymap.set('n', '<leader>d', '<cmd>make<CR>')
  end
}
