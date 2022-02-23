require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    disabled_filetypes = {},
    section_separators = {
        left = '', right = ''
    },
    component_separators = {
        left = '', right = ''
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
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
