return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    -- or                            , branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    init = function()
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Telescope Find Files"})
        vim.keymap.set('n', '<leader>fl', builtin.live_grep,  {desc = "Telescope Live Grep"})
        vim.keymap.set('n', '<C-p>',      builtin.git_files,  {desc = "Telescope Git Files"})
    end
}
