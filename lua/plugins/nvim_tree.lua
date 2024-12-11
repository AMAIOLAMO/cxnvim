local function custom_on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function options(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set('n', '?',         api.tree.toggle_help,                options('help'))
    vim.keymap.set('n', 'f',         api.live_filter.start,               options('Live filter open'))
    vim.keymap.set('n', 'F',         api.live_filter.clear,               options('Live filter Clear'))
    vim.keymap.set('n', '<C-r>',     api.fs.rename_sub,                   options('Rename: Omit Filename'))
    vim.keymap.set('n', '<CR>',      api.node.open.edit,                  options('Open'))
    vim.keymap.set('n', '<Tab>',     api.node.open.preview,               options('Open Preview'))
    vim.keymap.set('n', '.',         api.node.run.cmd,                    options('Run Command'))
    vim.keymap.set('n', 'a',         api.fs.create,                       options('Create File Or Directory'))
    vim.keymap.set('n', 'c',         api.fs.copy.node,                    options('Copy'))
    vim.keymap.set('n', 'C',         api.tree.change_root_to_node,        options('CD'))
    vim.keymap.set('n', 'd',         api.fs.remove,                       options('Delete'))
    vim.keymap.set('n', 'D',         api.fs.trash,                        options('Trash'))
    vim.keymap.set('n', 'e',         api.fs.rename_basename,              options('Rename: Basename'))
    vim.keymap.set('n', 'm',         api.marks.toggle,                    options('Toggle mark'))
    vim.keymap.set('n', 'bd',        api.marks.bulk.delete,               options('Mark: Bulk delete'))
    vim.keymap.set('n', 'bm',        api.marks.bulk.move,                 options('Mark: Bulk move'))
    vim.keymap.set('n', 'o',         api.node.open.edit,                  options('Open'))
    vim.keymap.set('n', 'O',         api.node.open.no_window_picker,      options('Open: No Window Picker'))
    vim.keymap.set('n', 'p',         api.fs.paste,                        options('Paste'))
    vim.keymap.set('n', 'P',         api.node.navigate.parent,            options('Parent Directory'))
    vim.keymap.set('n', 'q',         api.tree.close,                      options('Close'))
    vim.keymap.set('n', 'r',         api.fs.rename,                       options('Rename'))
    vim.keymap.set('n', 'R',         api.tree.reload,                     options('Refresh'))
    vim.keymap.set('n', 's',         api.node.run.system,                 options('Run System'))
    vim.keymap.set('n', 'x',         api.fs.cut,                          options('Cut'))
    vim.keymap.set('n', 'y',         api.fs.copy.filename,                options('Copy Name'))
    vim.keymap.set('n', 'Y',         api.fs.copy.relative_path,           options('Copy Relative Path'))
    vim.keymap.set('n', '<2-LeftMouse>',  api.node.open.edit,             options('Open'))
end


return {
    "nvim-tree/nvim-tree.lua",
    opts = {
        on_attach = custom_on_attach,
        view = {
            side = 'right',
            width = 30,
        },
        sync_root_with_cwd = true,
    },
    init = function()
        vim.keymap.set('n', '<leader>e', '<Cmd>NvimTreeToggle<CR>', {desc = "NvimTree Toggle"})
    end
}
