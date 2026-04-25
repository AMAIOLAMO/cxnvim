return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    -- or                            , branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "debugloop/telescope-undo.nvim",
    },
    init = function()
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, {desc = "Telescope Find Files"})
        vim.keymap.set("n", "<leader>fl", builtin.live_grep,  {desc = "Telescope Live Grep"})
        vim.keymap.set("n", "<leader>fm", builtin.man_pages,  {desc = "Telescope Man Pages"})
        vim.keymap.set("n", "<leader>fh", builtin.help_tags,  {desc = "Telescope Help Tags"})
        vim.keymap.set("n", "<C-p>",      builtin.git_files,  {desc = "Telescope Git Files"})
        vim.keymap.set("n", "<leader>cr", builtin.lsp_references,  {desc = "Telescope LSP References"})


        require("telescope").load_extension("fzf")
        require("telescope").load_extension("undo")

        vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", {desc = "Telescope Undo History"})
    end,
    opts = {
        pickers = {
            find_files = {
                theme = "ivy"
            },
            man_pages = {
                theme = "ivy"
            },
            help_tags = {
                theme = "ivy"
            },
            git_files = {
                theme = "ivy"
            },
            live_grep = {
                theme = "ivy"
            }
        },
        extensions = {
            fzf = {}
        }
    }
}
