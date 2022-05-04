-- lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

-- indent
require('indent_blankline').setup({
    char = '┊',
    buftype_exclude = { 'terminal' }
})


-- icons
require('nvim-web-devicons').setup({
  override = {
    zsh = {
      icon = '',
      color = '#428850',
      name = 'Zsh'
    }
  };
  default = true;
})

-- Bufferline
require("bufferline").setup{}

-- Nvim Tree
vim.g.nvim_tree_quit_on_open = 1
require('nvim-tree').setup({
  update_focused_file = {
    enable = true
  },
  filters = {
    custom = {'.git', 'node_modules'}
  }
})

-- colorschema
require('doom-one').setup({
  cursor_coloring = false,
  terminal_colors = false,
  italic_comments = false,
  enable_treesitter = true,
  transparent_background = false,
  pumblend = {
    enable = true,
    transparency_amount = 20,
  },
  plugins_integrations = {
    neorg = true,
    barbar = true,
    bufferline = false,
    gitgutter = false,
    gitsigns = true,
    telescope = false,
    neogit = true,
    nvim_tree = true,
    dashboard = true,
    startify = true,
    whichkey = true,
    indent_blankline = true,
    vim_illuminate = true,
    lspsaga = false,
  },
})

