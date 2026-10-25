local cgroup = vim.api.nvim_create_augroup("UserCustomAutoCmds", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = cgroup,
  pattern = {
    "javascript",
    "typescript",
    "typescriptreact",
    "go",
    "lua",
    "json",
    "yaml",
    "markdown",
    "nix",
    "toml",
    "java",
    "scala",
  },
  callback = function()
    vim.opt_local.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    vim.opt_local.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.opt_local.foldmethod = "expr"
  end,
})
