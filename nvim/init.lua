-- Source vim config
-- source
vim.cmd('source ~/.vimrc')
vim.keymap.set({"n","v","i"}, "<M-h>", "<cmd>cnext<CR>")
vim.keymap.set({"n","v","i"}, "<M-l>", "<cmd>cprev<CR>")
vim.keymap.set({"n","v","i"}, "<M-k>", "<cmd>copen<CR>")
vim.keymap.set({"n","v","i"}, "<M-j>", "<cmd>close<CR>")
-- nvim config
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.o.statusline = "%t %F"
vim.wo.statusline = '%t %F'

-- meta
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("n", "J", "mzJ`z")

require("config.lazy")
-- colorscheme
vim.cmd [[colorscheme tokyonight-night]]

-- terminal open autocmd
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function ()
	-- disable line numbers
	vim.opt.number = false
	vim.opt.relativenumber = false
	vim.cmd('startinsert')
  end
})

vim.keymap.set("n", "<leader>t", function ()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0,8)
end)

