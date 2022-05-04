require('telescope').setup({
  defaults = {
    borderchars = { '═', '║', '═', '║', '╔', '╗', '╝', '╚' },
  },
  extensions = {
    media_files = {
      filetypes = { 'png', 'webp', 'jpg', 'jpeg' },
      find_cmd = 'rg'
    }
  }
})

require('telescope').load_extension('media_files')

-- hignlight
vim.cmd [[ hi TelescopeBorde guifg=#2a2e36 ]]
vim.cmd [[ hi TelescopePromptBorder guifg=#2a2e36 ]]
vim.cmd [[ hi TelescopeResultsBorder guifg=#2a2e36 ]]
vim.cmd [[ hi TelescopePreviewBorder guifg=#2a2e36 ]]

