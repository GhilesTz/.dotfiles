return {
  {
    "folke/snacks.nvim",
    opts = {
      indent = {
        enabled = false,
      },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
    main = "ibl",
    opts = function(_, opts)
      opts = require("indent-rainbowline").make_opts(opts)
      opts.indent.char = ""
      opts.whitespace.remove_blankline_trail = false
      opts.scope.enabled = false
      return opts
    end,
    dependencies = {
      "TheGLander/indent-rainbowline.nvim",
    },
  },
}
