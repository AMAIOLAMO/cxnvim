return {
    'nvim-mini/mini.move',
    version = '*',
    config = function()
        local move = require('mini.move')
        move.setup({
            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
                left = '<M-h>',
                right = '<M-l>',
                down = 'J',
                up = 'K',

                -- Move current line in Normal mode
                line_left = '<M-h>',
                line_right = '<M-l>',
                line_down = 'J',
                line_up = 'K',
            },

            -- Options which control moving behavior
            options = {
                -- Automatically reindent selection during linewise vertical move
                reindent_linewise = true,
            },
        })
    end
}
