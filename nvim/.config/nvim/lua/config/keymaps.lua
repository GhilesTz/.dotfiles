-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "<C-d>", ":bd<CR>", { noremap = true, silent = true, desc = "Close current buffer" })
map("i", "<C-l>", "<C-o>x", { noremap = true, silent = true, desc = "Close current buffer" })

map("n", "<leader>U", vim.cmd.UndotreeToggle)

-- harpoon
map("n", "<leader>q", ":lua require('harpoon.mark').add_file()<CR>", { desc = "Add to harpoon list" })
map("n", "<leader>m", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { desc = "Open harpoon menu" })

map("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", { desc = "Harpoon navigate to file 1" })
map("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", { desc = "Harpoon navigate to file 2" })
map("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", { desc = "Harpoon navigate to file 3" })
map("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", { desc = "Harpoon navigate to file 4" })
map("n", "<leader>5", ":lua require('harpoon.ui').nav_file(5)<CR>", { desc = "Harpoon navigate to file 5" })
map("n", "<leader>6", ":lua require('harpoon.ui').nav_file(6)<CR>", { desc = "Harpoon navigate to file 6" })
map("n", "<leader>7", ":lua require('harpoon.ui').nav_file(7)<CR>", { desc = "Harpoon navigate to file 7" })
map("n", "<leader>8", ":lua require('harpoon.ui').nav_file(8)<CR>", { desc = "Harpoon navigate to file 8" })
map("n", "<leader>9", ":lua require('harpoon.ui').nav_file(9)<CR>", { desc = "Harpoon navigate to file 9" })
map("n", "<leader>0", ":lua require('harpoon.ui').nav_file(10)<CR>", { desc = "Harpoon navigate to file 10" })

map("n", "<leader>tt", require("toggle").toggle, { desc = "Toggle word" })

map("t", "<C-a>", "<C-\\><C-n>", { desc = "get out from terminal mode" })

map("n", "<leader>ls", function()
  if vim.o.laststatus == 0 then
    vim.o.laststatus = 3
  else
    vim.o.laststatus = 0
  end
end, { desc = "Toggle Status Line (LastStatus)" })

vim.keymap.set("n", "<leader>cd", function()
  local dir = vim.fn.expand("%:p:h")
  if dir ~= "" then
    vim.cmd("cd " .. dir)
    print("CWD changed to " .. dir)
  else
    print("No file in this buffer")
  end
end, { desc = "Set CWD to current file's directory" })

if vim.g.neovide then
  map("n", "<C-=>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
  end, { desc = "Increase Neovide FontSize" })

  map("n", "<C-->", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
  end, { desc = "Decrease Neovide FontSize" })

  local function save()
    vim.cmd.write()
  end
  local function copy()
    vim.cmd([[normal! "+y]])
  end
  local function paste()
    vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
  end

  vim.keymap.set({ "n", "i", "v" }, "<D-s>", save, { desc = "Save" })
  vim.keymap.set("v", "<D-c>", copy, { silent = true, desc = "Copy" })
  vim.keymap.set({ "n", "i", "v", "c", "t" }, "<D-v>", paste, { silent = true, desc = "Paste" })
end

map("n", "<leader>sm", function()
  require("snacks").scratch({
    ft = "markdown",
    reuse = false,
    autowrite = false,
  })
end, { desc = "New markdown scratch" })
