return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    keys = {
      {
        "<leader><leader>",
        "<cmd>Noice dismiss<CR>",
        desc = "Dismiss Noice messages",
      },
      {
        "<leader>na",
        "<cmd>NoiceAll<CR>",
        desc = "Noice: All",
      },
      {
        "<leader>nl",
        "<cmd>NoiceLast<CR>",
        desc = "Noice: last message",
      },
      {
        "<leader>nh",
        "<cmd>NoiceHistory<CR>",
        desc = "Noice: message history",
      },
    },
    opts = {
      messages = {
        view = "mini",
        view_error = "popup",
        view_warn = "popup",
      },
    },
  },
}
