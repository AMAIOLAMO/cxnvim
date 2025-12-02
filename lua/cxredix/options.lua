-- line numbers and relative line numbers
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = '90'

vim.cmd([[
        hi ColorColumn guifg=#202020 guibg=#191919
        hi ColorColumn ctermfg=lightgray ctermbg=lightgray
        hi TooLongMarker ctermbg=magenta guibg=#5f7a41 gui=underline
        call matchadd('TooLongMarker', '\%90v', 100)
]])

vim.opt.termguicolors = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.loader.enable()
