return {
    "sphamba/smear-cursor.nvim",
    event = "VeryLazy",
    cond = vim.g.neovide == nil,
    opts = {
        hide_target_hack = false,
        cursor_color = "none",
    }
}
