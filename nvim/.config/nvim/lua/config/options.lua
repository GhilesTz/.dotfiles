-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.o.cmdheight = 0
vim.opt.cursorline = false
vim.g.lazyvim_picker = "snacks"
vim.opt.wrap = false

vim.o.virtualedit = "all"

if vim.g.neovide then
  vim.defer_fn(function()
    -- vim.cmd("colorscheme rose-pine")
    -- vim.cmd("colorscheme monokai-pro-ristretto")
    -- vim.cmd("colorscheme default")
    vim.g.neovide_padding_top = 0
    vim.g.neovide_padding_bottom = 0
    vim.g.neovide_padding_right = 0
    vim.g.neovide_padding_left = 0

    local function get_system_font()
      local handle = io.popen("omarchy-font-current")
      local font
      if handle then
        font = handle:read("*a")
        handle:close()
      end
      font = font:gsub("'", "")
      font = font:gsub("\n", ":h13\0")
      font = font:gsub("%z", "")
      return font
    end

    local systemFont = get_system_font()
    vim.o.guifont = systemFont

    vim.opt.guicursor = {
      "n-v-c:block-Cursor",
      "i-ci-ve:ver25-Cursor",
      "r-cr:hor20-Cursor",
      "o:hor50-Cursor",
      "a:blinkwait700-blinkoff400-blinkon250-Cursor",
    }
  end, 0)
end
