vim.g.mapleader = " "
vim.opt.updatetime = 50
vim.opt.termguicolors = true
vim.opt.sidescroll = 8
vim.opt.sidescrolloff = 8
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.autoread = true
vim.bo.autoread = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.fillchars = { eob = " " }
vim.opt.foldlevel = 99
vim.opt.undofile = true -- enable persistent undo
vim.opt.undodir = vim.fn.stdpath("cache") .. "/undo" -- where to store undo history
vim.opt.signcolumn = "yes:1"
vim.opt.winbar = "%t"
vim.cmd([[
se tabstop=4
se shiftwidth=4
se expandtab
se smartindent
se autoindent
se nu
se relativenumber
tnoremap <Esc> <C-\><C-n>
]])
