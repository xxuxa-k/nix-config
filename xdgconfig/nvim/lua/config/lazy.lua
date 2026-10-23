require("lazy").setup({
  lockfile = vim.fn.stdpath("data") .. "/lazy-lock.json",
  defaults = {
    lazy = true,
  },
  spec = {
    { import = "plugins" },
  },
  change_detection = {
    enabled = false,
    notify = false,
  },
  checker = {
    enabled = true,
    notify = true,
  },
})
