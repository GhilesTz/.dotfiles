return {
  {
    "folke/snacks.nvim",
    opts = {
      zen = {
        toggles = {
          dim = false,
          backdrop = false, --{ transparent = false, blend = 100 }
          git_signs = false,
          mini_diff_signs = false,
          show = {
            statusline = false,
            tabline = false,
          },
        },

        win = {
          style = "minimal",
          width = 0.7, -- % relative width
        },
        on_open = function(win)
          vim.api.nvim_set_option_value("cursorline", false, { win = win.win })
        end,
        on_close = function()
          vim.opt.number = true
          vim.opt.relativenumber = true
        end,
      },
    },
  },
}
