vim.g.mapleader = " "

-- vim.keymap.set('n', '<leader>e', vim.cmd.Ex)
-- we have nvim tree (replacement of the original netrw explorer)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", {desc = "Move line down"})
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", {desc = "Move line up"})
vim.keymap.set('n', 'J', 'mzJ`z', {desc = "Merge Next Line"})

-- preserved paste
vim.keymap.set('x', '<leader>pp', "\"_dP", {desc = "Preserved Paste"})

-- yank to system clipboard
vim.keymap.set('n', '<leader>y', "\"+y", {desc = "Yank -> Sys Clipboard"})
vim.keymap.set('v', '<leader>y', "\"+y", {desc = "Yank -> Sys Clipboard"})

vim.keymap.set('n', '<leader>q', ":q<CR>", {desc = "Quit"})
vim.keymap.set('n', '<leader>w', ":w<CR>", {desc = "Write File"})

vim.cmd([[tnoremap <Esc> <C-\><C-n>]])

vim.keymap.set('n', '<C-h>', "<C-w>h")
vim.keymap.set('n', '<C-j>', "<C-w>j")
vim.keymap.set('n', '<C-k>', "<C-w>k")
vim.keymap.set('n', '<C-l>', "<C-w>l")

vim.keymap.set('n', '<C-=>', "<C-w>>") -- Expands window
vim.keymap.set('n', '<C-->', "<C-w><") -- shrinks window
