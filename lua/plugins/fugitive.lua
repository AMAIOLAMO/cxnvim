return {
    "tpope/vim-fugitive",
    init = function()
        vim.keymap.set("n", "<M-g>", function()
            if vim.g.fugitive_git_buffer == nil then
                vim.cmd("vert Git")
                vim.g.fugitive_git_buffer = vim.fn.bufnr(vim.fn.bufname(".git"))
            else
                vim.cmd.bdelete { vim.g.fugitive_git_buffer }
                vim.g.fugitive_git_buffer = nil
            end
        end, { desc = "Toggle Fugitive Git Window" })
    end
}
