return {
  {
    "mrjones2014/smart-splits.nvim",
    opts = {
      default_amount = 5,
    },
    keys = {
      {
        "<C-e>h",
        function() require('smart-splits').resize_left() end,
        mode = "n",
        desc = "Resize Left",
      },
      {
        "<C-e>l",
        function() require('smart-splits').resize_right() end,
        mode = "n",
        desc = "Resize Right",
      },
      {
        "<C-e>k",
        function() require('smart-splits').resize_up() end,
        mode = "n",
        desc = "Resize Up",
      },
      {
        "<C-e>j",
        function() require('smart-splits').resize_down() end,
        mode = "n",
        desc = "Resize Down",
      },
    },
  }
}
