local keymap = vim.api.nvim_set_keymap
local map = vim.api.nvim_set_keymap
local cmd = vim.cmd
local opts = {noremap = true, silent = true}


--Execute this file
map('n', '<leader>tj', ':call tj#save_and_exec()<CR>', opts)

-- Saves and exits
map('n', '<leader>q', '<ESC>:q!<CR>', opts)
map('n', 'çç', '<ESC>:w!<CR>', opts)
map('n', '<C-s>q', ':w!<CR>', opts)
map('i', '<C-s>q', ':w!<CR>', opts)
map('v', '<C-s>q', ':w!<CR>', opts)

-- Window moviment
map('n', 'sh', '<C-w>h',opts)
map('n', 'sj', '<C-w>j',opts)
map('n', 'sk', '<C-w>k',opts)
map('n', 'sl', '<C-w>l',opts)

-- Search and Center
map('n', 'n', 'nzzzv', opts)
map('v', 'n', 'nzzzv', opts)

-- Splits
map('n', '<leader>v', ':vsplit<CR>', opts)
map('n', '<leader>s', ':split<CR>', opts)
map('n', 'ss', ':vsplit<CR>', opts)
map('n', 'sv', ':split<CR>', opts)

-- TAB
map('i', 'TAB', '<ESC>', opts)
map('n', '<TAB>', ':BufferLineCycleNext<CR>', opts)
map('n', '<S-TAB>', ':BufferLineCyclePrev<CR>', opts)


-- NVIMTree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
-- map('n', '<leader>r', ':RnvimrToggle<CR>', opts)
-- map('n', '<leader>t', ':terminal<CR>', opts)
map('n', '<leader>n', ':NvimTreeFocus<CR>', opts)


-- LSP
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
map('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<leader>de', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

-- Harpoon
map('n', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>', opts)
map('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
map('n', '<C-y>', ':lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>', opts)
map('n', '<leader>j', ':lua require("harpoon.ui").nav_prev()<CR>', opts)
map('n', '<leader>k', ':lua require("harpoon.ui").nav_next()<CR>', opts)
map('n', '<leader>1', ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
map('n', '<leader>2', ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
map('n', '<leader>3', ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
map('n', '<leader>4', ':lua require("harpoon.ui").nav_file(4)<CR>', opts)

-- edgemotion
map('n','<C-j>', '<Plug>(edgemotion-j)',{silent=true})
map('n','<C-k>', '<Plug>(edgemotion-k)',{silent=true})
map('v','<C-j>', '<Plug>(edgemotion-j)',{silent=true})
map('v','<C-k>', '<Plug>(edgemotion-k)',{silent=true})


-- RESIZES
-- resize up and down
keymap('n', ';k',   ':resize +3 <CR>',          { noremap=true, silent=true })
keymap('n', ';j',   ':resize -3 <CR>',          { noremap=true, silent=true })
-- resize right and left
keymap('n', ';l',   ':vertical resize +3 <CR>', { noremap=true, silent=true })
keymap('n', ';h',   ':vertical resize -3 <CR>', { noremap=true, silent=true })

-- ALT RESIZES
-- resize up and down
keymap('n', '<A-k>',   ':resize +3 <CR>',          { noremap=true, silent=true })
keymap('n', '<A-j>',   ':resize -3 <CR>',          { noremap=true, silent=true })
-- resize right and left
keymap('n', '<A-l>',   ':vertical resize +3 <CR>', { noremap=true, silent=true })
keymap('n', '<A-h>',   ':vertical resize -3 <CR>', { noremap=true, silent=true })


-- move selected line(s) up or down
keymap('v', 'K', ":m '<-2<CR>gv=gv", {noremap=true, silent=true})
keymap('v', 'J', ":m '>+1<CR>gv=gv", {noremap=true, silent=true})


map('n', '<leader>oc', ':e ~/.config/nvim/lua/settings.lua<CR>', opts)
map('n', '<leader>nf', ':DashboardNewFile<CR>', opts)
map('n', '<leader>ss', ':SessionSave<CR>', opts)
map('n', '<leader>sl', ':SessionLoad<CR>', opts)
map('n', '<leader>v', ':vsplit <CR>', {silent = true})
map('n', '<leader>d', ':Lspsaga show_cursor_diagnostics<CR>', opts)


-- TELESCOPE

--      --> Launch Telescope without any argument
keymap('n', "\\\\", "<cmd>lua require('telescope.builtin').builtin() <CR>", {silent=true, noremap=true})

--       --> show all availabe MAPPING
keymap('n', "<leader>M", "<cmd>lua require('telescope.builtin').keymaps() <CR>", {silent=true, noremap=true})

--       --> show buffers/opened files
keymap('n', "<C-b>", "<cmd>lua require('telescope.builtin').buffers() <CR>", {silent=true, noremap=true})


--       --> Find Files
-- NOTE1: to get project root's directory, extra plugin (github.com/ygm2/rooter.nvim) is used.
-- any config related to project root is in seperate config file (lua/plugin_confs/rooter_nvim.lua)
-- to change settings related to working directory, refer to rooter_nvim.lua config file

-- Find files from current file's project
keymap('n', "<C-p>", ":Telescope find_files <cr>", {silent=true, noremap=true})
-- show all files from current working directory
keymap('n', "<C-f>", "<cmd>lua require('telescope.builtin').find_files( { cwd = vim.fn.expand('%:p:h') }) <CR>", {silent=true, noremap=true})



--       --> Code Action
-- for example, in flutter/dart you can wrap or delete widgets using code action.
-- for more see :help builtin.lsp_code_actions() or :help builtin.lsp_range_code_actions()
keymap('n', "<leader>ca", "<cmd>lua  require('telescope.builtin').lsp_code_actions( {layout_config={width=50, height=20} } ) <CR>", {silent=true, noremap=true})
keymap('x', "<leader>ca", "<cmd>lua  require('telescope.builtin').lsp_range_code_actions( {layout_config={width=50, height=25} } ) <CR>", {silent=true, noremap=true})
keymap('n', 'C-f', ':Telescope fd<CR>', opts)
keymap('n', '<leader>fo', ':Telescope oldfiles<CR>', opts)
keymap('n', '<leader>fb', ':Telescope buffers<CR>', opts)
keymap('n', '<leader>sf', ':Telescope live_grep<CR>', opts)
keymap('n', '<leader>ff', ':Telescope fd<CR>', opts)
keymap('n', '<leader>fc', ':Telescope colorscheme<CR>', opts)
-- keymap('n', '<leader>fc', ':lua FindColors()<CR>', opts)

-- GitSigns
map('n', '<leader>gs', ':Gitsigns toggle_current_line_blame<CR>', opts)

-- Commentary
map('n', '<leader>/', ':Commentary<CR>', opts)
map('v', '<leader>/', ':Commentary<CR>', opts)


-- TroubleToggle
map('n', '<leader>h', ':TroubleToggle<CR>', opts)
map('v', '<leader>h', ':TroubleToggle<CR>', opts)

--Format
map('n', '<leader>p', ':Neoformat prettier<CR>', opts)

--Zen Mode
map('n', '<leader>zz', ':TZAtaraxis<CR>', opts)
map('n', '<leader>zf', ':TZMinimalist<CR>', opts)
map('n', '<leader>zm', ':TZFocus<CR>', opts)

-- Controlando as Abas
map('n', '<leader>tn', ':tabnew<CR>', opts)
map('n', '<leader>,', ':tabprevious<CR>', opts)
map('n', '<leader>.', ':tabnext<CR>', opts)
