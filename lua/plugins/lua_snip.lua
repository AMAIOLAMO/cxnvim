local function snip_cpy(args, parent, user_args)
    return args[1][1]
end

local function setup_keybindings(lsnip)
    vim.keymap.set({"i", "s"}, "<C-L>", function() lsnip.jump( 1) end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-H>", function() lsnip.jump(-1) end, {silent = true})
end

return {
    "L3MON4D3/LuaSnip",
    version = "2.*",
    init = function()
        local lsnip = require("luasnip")
        
        setup_keybindings(lsnip)

        local snip = lsnip.snippet
        local txt  = lsnip.text_node
        local ins  = lsnip.insert_node
        local func = lsnip.function_node

        local head_guard = snip(
            {trig = "head_guard", desc = "portable header guard"}, {
            txt({"#pragma once", ""}),
            txt({"#ifndef _"}), ins(1), txt({"_H", ""}),

            txt({"#define _"}), func(snip_cpy, {1}), txt({"_H", "", ""}),

            ins(2), txt({"", ""}),

            txt({"#endif // _"}), func(snip_cpy, {1}), txt("_H")
        })
        
        lsnip.add_snippets("c", {
            head_guard
        })

        lsnip.add_snippets("cpp", {
            head_guard
        })

    end
}
