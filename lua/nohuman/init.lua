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
-- require("nohuman.colors_config.highlights")

-- Langauge server configuration
require("nohuman.plugins.config.lsp")


-- source our mappings last(may change)
vim.cmd("source ~/.config/nvim/lua/nohuman/maps.vim")

-- auto-commands
vim.cmd("source ~/.config/nvim/lua/nohuman/autocmd.vim")


