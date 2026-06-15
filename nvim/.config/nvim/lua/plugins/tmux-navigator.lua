return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "Navigate left", mode = { "n", "t" } },
    { "<C-j>", "<cmd>TmuxNavigateDown<CR>", desc = "Navigate down", mode = { "n", "t" } },
    { "<C-k>", "<cmd>TmuxNavigateUp<CR>", desc = "Navigate up", mode = { "n", "t" } },
    { "<C-l>", "<cmd>TmuxNavigateRight<CR>", desc = "Navigate right", mode = { "n", "t" } },
  },
  init = function()
    vim.g.tmux_navigator_no_mappings = 1
    vim.g.tmux_navigator_disable_when_zoomed = 0
  end,
}
