return {
    'nvim-mini/mini.align', version = '*',
    config = function()
        align = require('mini.align')
        align.setup({
            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                start = '<leader>a',
                start_with_preview = '<leader>A',
            },

            -- Default options controlling alignment process
            options = {
                split_pattern = '',
                justify_side = 'left',
                merge_delimiter = '',
            },

            -- Whether to disable showing non-error feedback
            -- This also affects (purely informational) helper messages shown after
            -- idle time if user input is required.
            silent = false,
        })
    end
}
