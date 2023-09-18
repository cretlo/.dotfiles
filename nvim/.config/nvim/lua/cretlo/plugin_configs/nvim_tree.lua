vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
  diagnostics = {
    enable = true,
  },

})

vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeFindFileToggle<Cr>', { desc='[NERDTree] Toggle nerdtree' })

