return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      flavour = "mocha", -- Available flavours: latte, frappe, macchiato, mocha
      background = { dark = "mocha" },
      transparent_background = false,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
        mini = true,
        -- For more plugins integrations see https://github.com/catppuccin/nvim#integrations
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
    end,
  },
}
