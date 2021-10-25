local gps = require("nvim-gps")
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'horizon',
    component_separators = {'', ''},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    lualine_c = { gps.get_location, condition = gps.is_available },
    lualine_x = {'branch', 'fileformat', 'filetype'},
    lualine_y = {'diff'},
    lualine_z = {'hostname'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'hostname'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'nvim-tree'}
}
