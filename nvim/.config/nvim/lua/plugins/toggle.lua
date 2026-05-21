return {
  "leblocks/toggle.nvim",
  config = {
    defaults = true,

    -- Restore cursor position after toggling a word (default: true)
    keep_cursor_position = true,

    -- Additional toggle pairs (merged with defaults)
    mappings = {
      {
        "a",
        "b",
        "c",
        "d",
        "e",
        "f",
        "g",
        "h",
        "i",
        "j",
        "k",
        "l",
        "m",
        "n",
        "o",
        "p",
        "q",
        "r",
        "s",
        "t",
        "u",
        "v",
        "x",
        "y",
        "z",
      },
      { "yes", "no" },
      { "foo", "bar", "baz" },
      { "Alice", "Bob", "David", "Carol" },
      {
        "Ghiles",
        "Massinissa",
        "Yugurten",
        "Idir",
        "Meqran",
        "Mezyane",
        "Mazigh",
      },
      {
        "Dihya",
        "Tinhinan",
        "Tilelli",
        "Tiziri",
        "Numidia",
      },
      {
        "let",
        "const",
      },
      {
        "local",
        "global",
      },
      {
        "small",
        "big",
      },
      {
        "sin",
        "cos",
        "tan",
      },
    },
  },
}
