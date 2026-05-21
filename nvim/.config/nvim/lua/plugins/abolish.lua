return {
  {
    "tpope/vim-abolish",
    init = function()
      -- Disable coercion mappings. I use coerce.nvim for that.
      vim.g.abolish_no_mappings = true
    end,
  },
  {
    "gregorias/coerce.nvim",
    tag = "v4.1.0",
    config = true,
  },
}
