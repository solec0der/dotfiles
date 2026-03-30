return {
  -- Darcula colorscheme to match Ghostty's JetBrains Darcula theme
  {
    "doums/darcula",
    lazy = false,
    priority = 1000,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "darcula",
    },
  },
}
