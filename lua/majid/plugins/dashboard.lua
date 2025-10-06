vim.pack.add({
  {src = 'https://github.com/nvimdev/dashboard-nvim'},
  {src = 'https://github.com/nvim-tree/nvim-web-devicons'}
})

require('dashboard').setup({
  config = {
    packages = {enable = true},
    shortcut = {
      {desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u'},
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f'
      }
    }
  }
})
