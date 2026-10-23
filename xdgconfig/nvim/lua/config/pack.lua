-- Home Manager keeps stdpath("config") in the read-only Nix store.
vim.opt.packlockfile = vim.fn.stdpath("data") .. "/nvim-pack-lock.json"

vim.pack.add({
  {
    src = "https://github.com/folke/lazy.nvim.git",
    version = "stable",
  },
  {
    src = "https://github.com/folke/tokyonight.nvim.git",
  },
}, { load = true })

vim.cmd.colorscheme("tokyonight-storm")
