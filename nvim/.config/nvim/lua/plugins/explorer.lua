return {
  {
    ---@type LazySpec
    "mikavilpas/yazi.nvim",
    enabled = false,
    version = "*", -- use the latest stable version
    event = "VeryLazy",
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "<leader>e",
        mode = { "n" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>cw",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
    },
    ---@type YaziConfig | {}
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      keymaps = {
        show_help = "<f1>",
      },
    },
    -- 👇 if you use `open_for_directories=true`, this is recommended
    init = function()
      -- mark netrw as loaded so it's not loaded at all.
      --
      -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
      vim.g.loaded_netrwPlugin = 1
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },

  {
    "stevearc/oil.nvim",
    -- enabled = false,
    ---@module 'oil'
    ---@type oil.SetupOpts

    opts = {

      default_file_explorer = true,
      columns = {
        -- "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
      },
      keymaps = {
        ["<C-l>"] = "actions.select",
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["<leader>ref"] = { "actions.refresh", mode = "n" },
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["<leader>cd"] = { "actions.cd", mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
      },
    },

    skip_confirm_for_simple_edits = true,
    -- show_hidden = true,
    keys = {
      {
        "<leader>e",
        mode = { "n" },
        "<cmd>Oil<cr>",
        desc = "Open Explorer (Oil)",
      },
    },

    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    lazy = false,
  },
}
