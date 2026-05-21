return {
  -- {
  --   "sudo-tee/opencode.nvim",
  --   -- enabled = false,
  --   config = function()
  --     -- Default configuration with all available options
  --     require("opencode").setup()
  --   end,
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     {
  --       "MeanderingProgrammer/render-markdown.nvim",
  --       opts = {
  --         anti_conceal = { enabled = false },
  --         file_types = { "markdown", "opencode_output" },
  --       },
  --       ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
  --     },
  --     -- Optional, for file mentions and commands completion, pick only one
  --     "saghen/blink.cmp",
  --
  --     -- Optional, for file mentions picker, pick only one
  --     "folke/snacks.nvim",
  --   },
  -- },
  {
    "nickjvandyke/opencode.nvim",
    -- enabled = false,
    version = "*", -- Latest stable release
    dependencies = {
      {
        -- `snacks.nvim` integration is recommended, but optional
        ---@module "snacks" <- Loads `snacks.nvim` types for configuration intellisense
        "folke/snacks.nvim",
        optional = true,
        opts = {
          input = {}, -- Enhances `ask()`
          picker = { -- Enhances `select()`
            actions = {
              opencode_send = function(...)
                return require("opencode").snacks_picker_send(...)
              end,
            },
            win = {
              input = {
                keys = {
                  ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
                },
              },
            },
          },
        },
      },
    },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        -- Your configuration, if any; goto definition on the type or field for details
        -- vim.api.nvim_create_user_command("OpencodePrompt", function()
        --   local buf = vim.api.nvim_create_buf(true, false)
        --
        --   vim.api.nvim_buf_set_name(buf, "opencode prompt")
        --   vim.api.nvim_set_current_buf(buf)
        --
        --   vim.bo[buf].buftype = ""
        --   vim.bo[buf].filetype = "markdown"
        -- end, {}),
      }

      vim.o.autoread = true -- Required for `opts.events.reload`

      -- Recommended/example keymaps
      vim.keymap.set({ "n" }, "<leader>ai", function()
        require("opencode").toggle()
      end, { desc = "Toggle opencode" })

      vim.keymap.set("n", "<leader>oo", function()
        local content = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
        require("opencode").prompt(content, { submit = true })
      end, { desc = "Send buffer to opencode" })

      vim.keymap.set({ "x" }, "<leader>a", function()
        require("opencode").ask("@this: ", { submit = true })
      end, { desc = "Ask opencode…" })

      vim.keymap.set({ "n" }, "<leader>a", function()
        require("opencode").ask()
      end, { desc = "Ask Opencode" })

      vim.keymap.set({ "x" }, "<leader>xp", function()
        require("opencode").ask("explain @this lines", { submit = true })
      end, { desc = "Tell opencode to explain lines" })

      vim.keymap.set({ "n", "x" }, "<leader>z", function()
        require("opencode").select()
      end, { desc = "Execute opencode action…" })

      vim.keymap.set({ "n", "x" }, "go", function()
        return require("opencode").operator("@this ")
      end, { desc = "Add range to opencode", expr = true })

      vim.keymap.set("n", "goo", function()
        return require("opencode").operator("@this ") .. "_"
      end, { desc = "Add line to opencode", expr = true })

      vim.keymap.set("n", "<S-C-K>", function()
        require("opencode").command("session.half.page.up")
      end, { desc = "Scroll opencode up" })

      vim.keymap.set("n", "<S-C-J>", function()
        require("opencode").command("session.half.page.down")
      end, { desc = "Scroll opencode down" })

      -- You may want these if you use the opinionated `<C-a>` and `<C-x>` keymaps above — otherwise consider `<leader>o…` (and remove terminal mode from the `toggle` keymap)
      -- vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
      -- vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
    end,
  },

  {
    "supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({})
    end,
  },
}
