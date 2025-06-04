return {
  {
    "AhmedAbdulrahman/vim-aylin",
    lazy = false, -- We want the colorscheme to load on startup
    priority = 1000, -- Make sure it loads before other plugins that might set a colorscheme
    config = function()
      -- Set the background to dark, as recommended by the aylin.vim author
      vim.opt.background = "dark"

      -- Load the colorscheme
      vim.cmd("colorscheme aylin")

      -- Optional: True colors (LazyVim likely handles this, but it doesn't hurt to be explicit)
      -- The original instructions mention these:
      -- if vim.fn.has("nvim") == 1 then
      --   vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1
      -- end
      if vim.fn.has("termguicolors") == 1 then
        vim.opt.termguicolors = true
      end

      -- Note: LazyVim's default setup usually ensures 'termguicolors' is enabled.
      -- You might not need the explicit 'termguicolors' lines above if everything
      -- looks correct without them.
    end,
  },
}
