-- A slightly altered version of catppucchin kolors
-- stylua: ignore
local kolors = {
  rosewater  = '#f5e0dc',
  flamingo   = '#f7768e',
  pink       = '#ff75a0',
  mauve      = '#9d7cd8',
  red        = '#f7768e',
  maroon     = '#db4b4b',
  peach      = '#ff9e64',
  yellow     = '#e0af68',
  green      = '#9ece6a',
  teal       = '#449dab',
  sky        = '#7dcfff',
  sapphire   = '#086efc',
  blue       = '#0841fc',
  lavender   = '#bb9af7',
  text       = '#c0caf5',
  subtext1   = '#a9b1d6',
  subtext0   = '#9aa5ce',
  overlay2   = '#7f849c',
  overlay1   = '#6c7086',
  overlay0   = '#565f89',
  surface2   = '#2a2e36',
  surface1   = '#232634',
  surface0   = '#1f2335',
  base       = '#1a1b26',
  mantle     = '#16161e',
  crust      = '#11121d',
}

local colorscheme = {
   foreground = kolors.text,
   background = kolors.base,
   cursor_bg = kolors.rosewater,
   cursor_border = kolors.rosewater,
   cursor_fg = kolors.crust,
   selection_bg = kolors.surface2,
   selection_fg = kolors.text,
   ansi = {
      '#0C0C0C', -- black
      '#EB6105', -- orange
      '#02F557', -- green
      '#FCE803', -- yellow
      '#079AF5', -- blue
      '#9624d4', -- magenta/purple
      '#02D1CA', -- cyan
      '#CCCCCC', -- white
   },
   brights = {
      '#767676', -- black
      '#F57520', -- red
      '#A4F502', -- green
      '#F9F1A5', -- yellow
      '#0596F7', -- blue
      '#B4009E', -- magenta/purple
      '#05CBF7', -- cyan
      '#F2F2F2', -- white
   },
   tab_bar = {
      background = 'rgba(0, 0, 0, 0.4)',
      active_tab = {
         bg_color = kolors.surface2,
         fg_color = kolors.text,
      },
      inactive_tab = {
         bg_color = kolors.surface0,
         fg_color = kolors.subtext1,
      },
      inactive_tab_hover = {
         bg_color = kolors.surface0,
         fg_color = kolors.text,
      },
      new_tab = {
         bg_color = kolors.base,
         fg_color = kolors.text,
      },
      new_tab_hover = {
         bg_color = kolors.mantle,
         fg_color = kolors.text,
         italic = true,
      },
   },
   visual_bell = kolors.red,
   indexed = {
      [16] = kolors.peach,
      [17] = kolors.surface2,
   },
   scrollbar_thumb = kolors.surface2,
   split = kolors.overlay0,
   compose_cursor = kolors.flamingo,
}

return colorscheme
