return {
    "romgrk/barbar.nvim",
    config = function()
        vim.g.barbar_auto_setup = false

        local barbar = require('barbar')

        barbar.setup({
            animation = true,
            clickable = true,

            separator = { left = '▎', right = '' },

            -- NOTE: OBSOLETE: nvim tree is removed
            -- sidebar_filetypes = {
            --     NvimTree = true,
            -- }
        })

        vim.keymap.set('n', 'H', '<Cmd>BufferPrevious<CR>', {desc = "Buffer Previous"})
        vim.keymap.set('n', 'L', '<Cmd>BufferNext<CR>', {desc = "Buffer Next"})

        vim.keymap.set('n', '<leader>x', '<Cmd>BufferClose<CR>', {desc = "Buffer Close"})

        -- NOTE: dont really use this much
        -- vim.keymap.set('n', '<leader>bp', '<Cmd>BufferPick<CR>', {desc = "Buffer Pick"})
    end
}
