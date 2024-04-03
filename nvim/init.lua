local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath,})
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
-- opt.grepprg = "rg --vimgrep"
opt.termguicolors = true -- True color support
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.ignorecase = true -- Ignore case
opt.spelllang = { "en" }
opt.mouse =  ""
opt.colorcolumn = "80"
vim.g.markdown_recommended_style = 0
vim.g.airline_theme = 'sonokai'
-- vim.g.sonokai_style = 'atlantis'
vim.g.sonokai_better_performance = 1

require("lazy").setup({{import = "plugins"}}, opts)
