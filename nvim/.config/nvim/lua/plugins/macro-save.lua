return {
  "jesseleite/nvim-macroni",
  lazy = false,
  config = function()
    require("macroni").setup({
      macros = {
        make_todo_list_item = {
          macro = "^iTODO:<Space><Esc>gcc",
          keymap = "<Leader>t",
        },
      },
    })
  end,
}
