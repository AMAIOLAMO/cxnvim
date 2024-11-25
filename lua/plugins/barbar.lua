return {
    "romgrk/barbar.nvim",
    config = function()
        vim.g.barbar_auto_setup = false

        local barbar = require('barbar')

        barbar.setup({
            animation = true,
            clickable = true,

            separator = { left = '▎', right = '' },

            sidebar_filetypes = {
                NvimTree = true,
            }
        })

        vim.keymap.set('n', 'H', '<Cmd>BufferPrevious<CR>')
        vim.keymap.set('n', 'L', '<Cmd>BufferNext<CR>')

        vim.keymap.set('n', '<leader>x', '<Cmd>BufferClose<CR>')

        vim.keymap.set('n', '<leader>bp', '<Cmd>BufferPick<CR>')
    end
}
