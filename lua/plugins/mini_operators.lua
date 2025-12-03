return {
    'nvim-mini/mini.operators',
    version = '*',
    config = function()
        local operators = require('mini.operators')
        operators.setup({
            -- Each entry configures one operator.
            -- `prefix` defines keys mapped during `setup()`: in Normal mode
            -- to operate on textobject and line, in Visual - on selection.

            -- Exchange text regions
            exchange = {
                -- NOTE: Default `gx` is remapped to `gX`
                prefix = 'gx',

                -- Whether to reindent new text to match previous indent
                reindent_linewise = true,
            },

            -- Multiply (duplicate) text
            multiply = {
                prefix = 'gm',

                -- Function which can modify text before multiplying
                func = nil,
            },
            
            -- Sort text
            sort = {
                prefix = 'gs',

                -- Function which does the sort
                func = nil,
            }
        })
    end
}
