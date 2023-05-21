return {
  -- add gruvbox
  {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
},

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  }
}
