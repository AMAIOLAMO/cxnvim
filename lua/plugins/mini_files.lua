local mf_toggle = function(...)
    local mf = require("mini.files")
    if not mf.close() then
        mf.open(...)
    end
end

return {
    'echasnovski/mini.files',
    version = '*',
    init = function()
        vim.keymap.set("n", "<leader>e", mf_toggle, { desc = "Minifiles Toggle" })
    end,
    opts = {
        options = {
            use_as_default_explorer = true,
        },
        -- default mappings for reference
        mappings = {
            close       = 'q',
            go_in       = 'l',
            go_in_plus  = 'L',
            go_out      = 'h',
            go_out_plus = 'H',
            mark_goto   = "'",
            mark_set    = 'm',
            reset       = '<BS>',
            reveal_cwd  = '@',
            show_help   = 'g?',
            synchronize = ';',
            trim_left   = '<',
            trim_right  = '>',
        },
    }
}
