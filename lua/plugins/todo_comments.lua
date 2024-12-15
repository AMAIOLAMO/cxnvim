return {
    "folke/todo-comments.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    init = function()
        vim.keymap.set("n", "<leader>tl", ":TodoLocList<CR>", {desc = "Todo Location List"})

        vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", {desc = "Telescope Todo"})
    end,
    config = true
}
