return {
  {
    "brenton-leighton/multiple-cursors.nvim",
    enabled = false,
    version = "*", -- Use the latest tagged version
    opts = {}, -- This causes the plugin setup function to be called
    keys = {
      { "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
      { "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move down" },

      { "<C-LeftMouse>", "<Cmd>MultipleCursorsMouseAddDelete<CR>", mode = { "n", "i" }, desc = "Add or remove cursor" },

      {
        "<Leader>m",
        "<Cmd>MultipleCursorsAddVisualArea<CR>",
        mode = { "x" },
        desc = "Add cursors to the lines of the visual area",
      },

      { "<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" }, desc = "Add cursors to cword" },
      {
        "<C-m>",
        "<Cmd>MultipleCursorsAddMatchesV<CR>",
        mode = { "n", "x" },
        desc = "Add cursors to cword in previous area",
      },

      {
        "<C-n>",
        "<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
        mode = { "n", "x" },
        desc = "Add cursor and jump to next cword",
      },
      { "<C-q>", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Jump to next cword" },
    },
  },

  {
    "mg979/vim-visual-multi",
    -- enabled = false,
    keys = {
      {
        "<C-j>",
        "<Plug>(VM-Add-Cursor-Down)",
        mode = { "n", "x" },
      },
      {
        "<C-k>",
        "<Plug>(VM-Add-Cursor-Up)",
        mode = { "n", "x" },
      },

      {
        "cp",
        "vip<Plug>(VM-Visual-Cursors)",
        mode = { "n", "x" },
        remap = true,
      },
    },
  },
}
