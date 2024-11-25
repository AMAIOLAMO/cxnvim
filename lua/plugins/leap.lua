return {
    "ggandor/leap.nvim",
    lazy = false,
    config = function()
        local leap = require('leap')

        leap.create_default_mappings()
    end
}
