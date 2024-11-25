local function fugitive_get_git_winnr()
    return vim.fn.bufwinnr(".git")
end

local function fugitive_git_win_exists()
    return fugitive_get_git_winnr() ~= -1
end

return {
    "tpope/vim-fugitive",
    init = function()
        vim.keymap.set("n", "<M-g>", function()
            if fugitive_git_win_exists() == true then
                vim.cmd( fugitive_get_git_winnr() .. "close" )
            else
                vim.cmd("vert Git")
            end
        end, { desc = "Toggle Fugitive Git Window" })
    end
}
