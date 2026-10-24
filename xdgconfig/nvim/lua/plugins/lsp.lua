return {
  {
    "nvimdev/lspsaga.nvim",
    cmd = "Lspsaga",
    opts = {
      symbol_in_winbar = { enable = false },
      ui = { code_action = "" },
    },
    keys = {
      {"<C-]>", "<Cmd>Lspsaga goto_definition<CR>", desc = "Go to definition",},
      {"[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "Prev diagnostic",},
      {"]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", desc = "Next diagnostic",},
      {"<Leader>t", "<Cmd>Lspsaga term_toggle<CR>", mode = { "n", "t" }, desc = "Toggle terminal",},
      {"K", "<Cmd>Lspsaga hover_doc<CR>", desc = "Hover doc" },
      {"P", "<Cmd>Lspsaga peek_definition<CR>", desc = "Peek definition" },
      {"<Leader>o", "<Cmd>Lspsaga outline<CR>", desc = "Outline",},
      {"<Leader>c", "<Cmd>Lspsaga code_action<CR>", desc = "Code action",},
      {"<Leader>da", "<Cmd>Lspsaga show_buf_diagnostics<CR>", desc = "Buffer diagnostics",},
      {"<Leader>dl", "<Cmd>Lspsaga show_line_diagnostics<CR>", desc = "Line diagnostics",},
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua",
        opts = { library = { "lazy.nvim" } },
      },
    },
    config = function()
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })
      vim.lsp.config("bashls", {
        filetypes = { "bash", "sh", "zsh" },
      })
      vim.lsp.config("lua_ls", {
        on_init = function(client)
          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              version = 'LuaJIT',
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
              }
            }
          })
        end,
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
          }
        },
      })
      vim.lsp.enable({
        "lua_ls",
        "gopls",
        "bashls",
        "html",
        "tailwindcss",
        "cssls",
        "jsonls",
        "biome",
        "nixd",
        "tombi",
      })
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup('UserLspStartTs', { clear = true }),
        pattern = {
          "javascript",
          "javascriptreact",
          "javascript.jsx",
          "typescript",
          "typescriptreact",
          "typescript.tsx",
        },
        callback = function(ev)
          if vim.fs.root(ev.buf, { "package.json"}) then
            vim.lsp.enable("ts_ls")
            return
          end
          if vim.fs.root(ev.buf, { "deno.json", "deno.jsonc"}) then
            vim.lsp.enable("denols")
            return
          end

        end,
      })
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
      win = {
        wo = {
          wrap = true,
        },
      },
    },
    keys = {
      {
        "<Leader>xx",
        "<cmd>Trouble diagnostics toggle<CR>",
        desc = "Diagnostics (Trouble)",
      }
    },
  },
}
