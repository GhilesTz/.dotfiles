return {
  {
    "folke/snacks.nvim",
    opts = {
      zen = {
        toggles = {
          dim = false,
          git_signs = false,
          mini_diff_signs = false,
          show = {
            statusline = false,
            tabline = false,
          },
        },

        win = {
          style = "minimal",
          width = 0.8, -- 80% relative width
        },
        on_open = function(win)
          vim.api.nvim_set_option_value("cursorline", false, { win = win.win })
        end,
        on_close = function(win)
          vim.opt.number = true
          vim.opt.relativenumber = true
        end,
      },
    },
  },
}
