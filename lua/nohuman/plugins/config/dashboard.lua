local vim = vim
local g = vim.g

vim.cmd("packadd dashboard-nvim")

g.dashboard_default_executive = "telescope"

local custom_header = {
   "      N_O_H  H U M A N  I N T E R F A C E  | IDE |      ",
}

g.dashboard_custom_header = custom_header

g.dashboard_custom_section = {
  a = {
    description = { "  EXPLORER                    SPC e" },
    command = "NvimTreeToggle",
  },
  b = {
    description = { "  FIND FILE                  SPC f f" },
    command = "Telescope find_files",
  },
  c = {
    description = { "冷 FIND PROJECT               SPC f p" },
    command = "Telescope projects",
  },
  d = {
    description = { "  RECENTS                    SPC f o" },
    command = "Telescope oldfiles",
  },
  e = {
    description = { "洛 NEW BUFFER                 SPC g g" },
    command = "enew",
  },
  f = {
    description = { "  EDIT CONFIGURATION         SPC d c" },
    command = "e ~/.config/nvim/lua/nohuman/config.lua",
  },
}

g.dashboard_custom_footer = { "NOHUMAN.NVIM" }
