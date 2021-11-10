local vim = vim

-- line-numbers must be declared before dashboard
-- init because otherwise dashboard shows line numbers
-- vim.opt.nu = true
-- vim.opt.rnu = true

require("nohuman.options")
-- global variables
require("nohuman.config")
require("nohuman.mappings")
require("nohuman.functions")
-- Plugin configurations
require("nohuman.plugins")
require("nohuman.utils")
require("nohuman.hooks")

-- tj-functions-commands
vim.cmd("source ~/.config/nvim/lua/nohuman/tj.vim")

-- Colors
require("nohuman.colors_config")
require("nohuman.colors_config.highlights")

-- Langauge server configuration
require("nohuman.plugins.config.lsp")

-- auto-commands
vim.cmd("source ~/.config/nvim/lua/nohuman/autocmd.vim")


-- Set Division window colors
vim.cmd[[au VimEnter * highlight MsgArea guibg=#0B0F14]]
vim.cmd[[au VimEnter * highlight VertSplit guibg=#0B0F14 guifg=#0B0F14]]
-- Set Hybrid numbers
vim.cmd[[set nu rnu]]
