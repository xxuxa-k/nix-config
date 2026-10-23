vim.g.mapleader = " "
vim.g.maplocalleader = ","

local opts = function(desc)
    return {
        silent = true,
        desc = desc,
    }
end

vim.keymap.set(
"n",
"<Esc><Esc>",
"<cmd>noh<CR>",
opts("noh")
)
