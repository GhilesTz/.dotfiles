return {
  {
    "Mofiqul/vscode.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    config = {
      sections = {
        lualine_z = {
          {
            require("opencode").statusline,
          },
        },
      },
    },
  },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "c", "cpp", "ruby", "typst", "java", "go", "rust" },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      -- List of parsers to ignore installing (or "all")
      ignore_install = { "" },

      ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
      -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

      highlight = {
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages

        additional_vim_regex_highlighting = false,
      },
    },
  },

  -- or you can return new options to override all the defaults
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        options = {
          -- section_separators = { left = "", right = "" },
          -- component_separators = { left = "", right = "" },
          --
          section_separators = "",
          component_separators = "",
        },
      }
    end,
  },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  -- { import = "lazyvim.plugins.extras.lang.json" },

  -- add any tools you want to have installed below
  {
    "mason-org/mason.nvim",

    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

  {
    require("blink.cmp").setup({

      keymap = {
        preset = "default",
        ["<CR>"] = {}, -- dont autocomplete when enter
      },
      completion = {
        menu = {
          auto_show = function(ctx)
            return ctx.mode ~= "default"
          end,
          -- auto_show = true,
          -- auto_show_delay_ms = 1500,
        },
        ghost_text = {
          enabled = true,
        },
      },
    }),
  },
}
