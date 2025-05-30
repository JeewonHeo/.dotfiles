local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ 
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)


local opt = vim.opt
opt.clipboard = "unnamedplus"
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.tabstop = 2
opt.softtabstop = 2
opt.number = true -- Print line number
-- opt.relativenumber = true
opt.termguicolors = true -- True color support
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.ignorecase = true -- Ignore case
opt.spelllang = { "en" }
opt.mouse =  ""
opt.colorcolumn = "100"

vim.opt.swapfile = false
vim.g.markdown_recommended_style = 0
vim.g.airline_theme = 'sonokai'
vim.g.sonokai_better_performance = 1

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = function() return vim.fn.getreg('+') end,
    ['*'] = function() return vim.fn.getreg('*') end,
  },
}
require("lazy").setup({ {import = "plugins"}, {import = "plugins.lsp"} }, opts)
