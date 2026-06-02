require "nvchad.options"
-- vim.opt.backup = true
vim.opt.number = true
vim.opt.relativenumber = true 

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.linebreak = true

vim.opt.scrolloff = 10
vim.opt.mouse = 'a'

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.inccommand = 'split'

vim.opt.undofile = true

vim.cmd [[
  iabbrev @@ sojibulislamrana.dev@gmail.com
]]

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp= '␣' }

vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

vim.opt.clipboard = 'unnamedplus'
vim.keymap.set('n', '<leader>a', ':split | terminal<CR>')

vim.keymap.set('n', '<M-j>', ':m .+1<CR>>==')
vim.keymap.set('n', '<M-k>', ':m .-2<CR>>==')

vim.keymap.set('n', '<leader>ec', ':w<CR>:!clang % -o %:r && ./%:r<CR>')

vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})
