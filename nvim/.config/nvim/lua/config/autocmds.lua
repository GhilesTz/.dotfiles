-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Ensure the initial window also has nowrap

-- local function is_git_dir()
--   return vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null") ~= ""
-- end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local arg = vim.fn.argv(0)
    if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
      vim.cmd("cd " .. arg)
    end

    local path = vim.fn.expand("%:p")
    if vim.fn.isdirectory(path) == 1 then
      Snacks.picker.files()
    end
  end,
})
