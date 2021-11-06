require("harpoon").setup({
  global_settings = {
    save_on_toggle = false,
    save_on_change = true,
    save_on_sendcmd = false,
  },
})


local keymap = vim.api.nvim_set_keymap
local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local opts = {noremap = true, silent = true}


map('n', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>', opts)
map('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
map('n', '<C-y>', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', opts)


map('n', '<leader>j', ':lua require("harpoon.ui").nav_prev()<CR>', opts)
map('n', '<leader>k', ':lua require("harpoon.ui").nav_next()<CR>', opts)


map('n', '<leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
map('n', '<leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
map('n', '<leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
map('n', '<leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>', opts)

