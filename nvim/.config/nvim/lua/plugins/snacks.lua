return {
  "folke/snacks.nvim",

  ---@type snacks.Config
  opts = {

    notifier = {
      enabled = false,
    },

    terminal = {
      enabled = false,
    },

    explorer = {
      enabled = false,
    },

    dashboard = {
      width = 60,
      row = nil, -- dashboard position. nil for center
      col = nil, -- dashboard position. nil for center
      pane_gap = 4, -- empty columns between vertical panes
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
      -- These settings are used by some built-in sections
      preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
          },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
        },

        header = [[
                           ⠀⠀⠀⠀⣾⣿⣿⣧
                           ⣰⣿⣿⣿⣿⣿⣿⣿
                           ⠸⣿⣿⣿⣿⣿⣿⠏
                           ⠀⠈⠛⠿⣿⡟
 	                                                                       
 	       ████ ██████           █████                               
 	      ███████████             █████                             
 	      █████████ ███████████████████ ███   ███████████   
 	     █████████  ███    █████████████ █████ ██████████████   
 	    █████████ ██████████ █████████ █████ █████ ████ █████   
 	  ███████████ ███    ███ █████████ █████ █████ ████ █████  
 	 ██████  █████████████████████ ████ █████ █████ ████ ██████ 
	                                                                       
]],
      },
      -- item field formatters

      formats = {
        icon = function(item)
          if item.file and item.icon == "file" or item.icon == "directory" then
            return Snacks.dashboard.icon(item.file, item.icon)
          end
          return { item.icon, width = 2, hl = "icon" }
        end,
        footer = { "%s", align = "center" },
        header = { "%s", align = "center" },
        file = function(item, ctx)
          local fname = vim.fn.fnamemodify(item.file, ":~")
          fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
          if #fname > ctx.width then
            local dir = vim.fn.fnamemodify(fname, ":h")
            local file = vim.fn.fnamemodify(fname, ":t")
            if dir and file then
              file = file:sub(-(ctx.width - #dir - 2))
              fname = dir .. "/…" .. file
            end
          end
          local dir, file = fname:match("^(.*)/(.+)$")
          return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
        end,
      },
      sections = {
        {
          section = "header",
        },
        { section = "keys", padding = 1, indent = 2, icon = " ", title = "Basic Commands" },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        -- {
        --   pane = 1,
        --   section = "terminal",
        --   cmd = "kitty +kitten icat ~/.config/nvim/public/catpuccin.png",
        --   height = 20,
        -- },
      },
    },
  },

  keys = {
    {
      "<leader><leader>",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },

    {
      "<leader>fs",
      function()
        Snacks.picker.smart()
      end,
      desc = "Find Files but smart",
    },
  },
}
