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
  opts(":noh")
)
vim.keymap.set(
  "n",
  "<Leader>w",
  "<cmd>w<CR>",
  opts(":w")
)
vim.keymap.set(
  "n",
  "<Leader>q",
  "<cmd>q!<CR>",
  opts(":q!")
)
vim.keymap.set("n", "<Leader>pf", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("Copied to clipboard: " .. path)
end, opts("Copy file absolute path"))

