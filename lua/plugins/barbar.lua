--- @enum buffers.Special
local Special = {
  HELP = 1,
  QUICK_FIX = 2,
  MAN = 3,
  FUGITIVE = 4,
  NVIM_TREE = 5,
  DIR = 6,
  OTHER = 7,
}

-- https://github.com/alex-courtis/arch/blob/d7f5218bc60ced24a8b4dc22d9c11c374d6b8f18/config/nvim/lua/amc/buffers.lua
local function is_special(bufnr)
  local buftype = vim.bo[bufnr].buftype
  local bufhidden = vim.bo[bufnr].bufhidden

  -- scratch is not special
  if buftype == "nofile" and bufhidden == "hide" then
    return nil
  end

  local filetype = vim.bo[bufnr].filetype
  local bufname = vim.api.nvim_buf_get_name(bufnr)

  if buftype == "help" then
    return Special.HELP
  elseif buftype == "quickfix" then
    return Special.QUICK_FIX
  elseif filetype == "man" then
    return Special.MAN
  elseif filetype:match("^fugitive") then
    return Special.FUGITIVE
  elseif filetype == "NvimTree" then
    return Special.NVIM_TREE
  elseif vim.fn.isdirectory(bufname) ~= 0 then
    return Special.DIR
  elseif buftype ~= "" then
    return Special.OTHER
  end

  return nil
end

return {
    "romgrk/barbar.nvim",
    config = function()
        vim.g.barbar_auto_setup = false

        local barbar = require('barbar')

        barbar.setup({
            animation = true,
            clickable = true,

            separator = { left = '▎', right = '' },

            sidebar_filetypes = {
                NvimTree = true,
            }
        })

        vim.keymap.set('n', 'H', '<Cmd>BufferPrevious<CR>', {desc = "Buffer Previous"})
        vim.keymap.set('n', 'L', '<Cmd>BufferNext<CR>', {desc = "Buffer Next"})

        -- instead of directly closing the buffer, which disrupts the workspace layout
        -- simply wipe it, and replace with scratch buffer if empty
        vim.keymap.set('n', '<leader>x', function()
            if not is_special(0) then
                pcall(vim.cmd.bw, { bang = true })
            end
        end)

        -- NOTE: dont really use this much

        -- vim.keymap.set('n', '<leader>bp', '<Cmd>BufferPick<CR>', {desc = "Buffer Pick"})
    end
}
