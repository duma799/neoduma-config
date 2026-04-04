-- Basic vim options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.colorcolumn = ""
vim.opt.signcolumn = "yes"
vim.opt.clipboard = "unnamedplus"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.cursorline = true

-- Font size for GUI clients
vim.opt.guifont = "MesloLGS Nerd Font:h20:sb"

-- Neovide-specific settings (only applies when running in Neovide)
if vim.g.neovide then
  -- Smooth cursor animations
  vim.g.neovide_cursor_animation_length = 0.13
  vim.g.neovide_cursor_trail_size = 0.8

  -- Cursor particle effects (choose one style or comment out for no particles)
  vim.g.neovide_cursor_vfx_mode = "railgun"  -- Options: railgun, torpedo, pixiedust, sonicboom, ripple, wireframe
  vim.g.neovide_cursor_vfx_opacity = 200.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  vim.g.neovide_cursor_vfx_particle_density = 7.0
  vim.g.neovide_cursor_vfx_particle_speed = 10.0

  -- Smooth scrolling
  vim.g.neovide_scroll_animation_length = 0.3

  -- Floating blur (background blur for floating windows)
  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

  -- Transparency
  vim.g.neovide_transparency = 0.95
  vim.g.neovide_window_blurred = true

  -- Refresh rate
  vim.g.neovide_refresh_rate = 60

  -- Padding
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
end
