local colors = require("nohuman.colors_config").get()
local lsp = require("feline.providers.lsp")

local icon_styles = {
  default = {
    left = "",
    right = " ",
    main_icon = "  ",
    vi_mode_icon = " ",
    position_icon = " ",
  },
  arrow = {
    left = "",
    right = "",
    main_icon = "  ",
    vi_mode_icon = " ",
    position_icon = " ",
  },

  block = {
    left = "  ",
    right = "  ",
    main_icon = "   ",
    vi_mode_icon = "  ",
    position_icon = "  ",
  },

  round = {
    left = "",
    right = "",
    main_icon = "  ",
    vi_mode_icon = " ",
    position_icon = " ",
  },

  slant = {
    left = " ",
    right = " ",
    main_icon = "  ",
    vi_mode_icon = " ",
    position_icon = " ",
  },
}


local mode_colors = {
  ["n"] = { "NORMAL", colors.red },
  ["no"] = { "N-PENDING", colors.red },
  ["i"] = { "INSERT", colors.dark_purple },
  ["ic"] = { "INSERT", colors.dark_purple },
  ["t"] = { "TERMINAL", colors.green },
  ["v"] = { "VISUAL", colors.cyan },
  ["V"] = { "V-LINE", colors.cyan },
  [""] = { "V-BLOCK", colors.cyan },
  ["R"] = { "REPLACE", colors.orange },
  ["Rv"] = { "V-REPLACE", colors.orange },
  ["s"] = { "SELECT", colors.nord_blue },
  ["S"] = { "S-LINE", colors.nord_blue },
  [""] = { "S-BLOCK", colors.nord_blue },
  ["c"] = { "COMMAND", colors.pink },
  ["cv"] = { "COMMAND", colors.pink },
  ["ce"] = { "COMMAND", colors.pink },
  ["r"] = { "PROMPT", colors.teal },
  ["rm"] = { "MORE", colors.teal },
  ["r?"] = { "CONFIRM", colors.teal },
  ["!"] = { "SHELL", colors.green },
}


local user_statusline_style = vim.g.nohuman_ui.statusline_style
local statusline_style = icon_styles[user_statusline_style]
-- local statusline_style = icon_styles.block

-- Initialize the components table
local components = {
  active = {},
  inactive = {},
}

-- Initialize left, mid and right
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.active, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})
table.insert(components.inactive, {})



-- components.active[1][1] = {
--   provider = function()
--     local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
--     return "  " .. dir_name .. "   "
--   end,

--   hl = {
--     fg = colors.statusline_bg,
--     bg = colors.white,
--   },
-- }


-- components.active[1][2] = {
--   provider = statusline_style.main_icon,

--   hl = {
--     fg = "#FFFFFF", --colors.statusline_bg,
--     bg = colors.statusline_bg,
--   },
--   -- right_sep = {
--   --   str = statusline_style.right,
--   --   hl = {
--   --     fg = colors.nord_blue,
--   --     bg = colors.statusline_bg,
--   --   },
--   -- },
-- }
components.active[1][1] = {
  provider =  "git_branch",
  hl = {
    fg = colors.white,
    bg = colors.statusline_bg,
  },
  icon = "  ",
}

components.active[1][2] = {
  provider = " " .. statusline_style.left,
  hl = {
    fg = colors.one_bg2,
    bg = colors.statusline_bg,
  },
}

components.active[1][3] = {
  provider = function()
    local filename = vim.fn.expand("%:t")
    local extension = vim.fn.expand("%:e")
    local icon = require("nvim-web-devicons").get_icon(filename, extension)
    if icon == nil then
      icon = ""
      return icon
    end
    return " " .. icon .. " " .. filename .. " "
  end,
  hl = {
    fg = colors.white,
    bg = colors.statusline_bg,
  },

  right_sep = {
    str = statusline_style.right,
    hl = {
      fg = colors.white,
      bg = colors.statusline_bg
    },
  },
}


components.active[1][4] = {
  provider = "git_diff_added",
  hl = {
    fg = colors.grey_fg2,
    bg = colors.statusline_bg,
  },
  icon = " ",
}
-- diffModfified
components.active[1][5] = {
  provider = "git_diff_changed",
  hl = {
    fg = colors.grey_fg2,
    bg = colors.statusline_bg,
  },
  icon = "   ",
}
-- diffRemove
components.active[1][6] = {
  provider = "git_diff_removed",
  hl = {
    fg = colors.grey_fg2,
    bg = colors.statusline_bg,
  },
  icon = "  ",
}

components.active[1][7] = {
  provider = "diagnostic_errors",
  enabled = function()
    return lsp.diagnostics_exist("Error")
  end,
  hl = { fg = colors.red },
  icon = "  ",
}

components.active[1][8] = {
  provider = "diagnostic_warnings",
  enabled = function()
    return lsp.diagnostics_exist("Warning")
  end,
  hl = { fg = colors.yellow },
  icon = "  ",
}

components.active[1][9] = {
  provider = "diagnostic_hints",
  enabled = function()
    return lsp.diagnostics_exist("Hint")
  end,
  hl = { fg = colors.grey_fg2 },
  icon = "  ",
}

components.active[1][10] = {
  provider = "diagnostic_info",
  enabled = function()
    return lsp.diagnostics_exist("Information")
  end,
  hl = { fg = colors.green },
  icon = "  ",
}

components.active[2][1] = {
  provider = function()
    local Lsp = vim.lsp.util.get_progress_messages()[1]
    if Lsp then
      local msg = Lsp.message or ""
      local percentage = Lsp.percentage or 0
      local title = Lsp.title or ""
      local spinners = {
        "",
        "",
        "",
      }

      local success_icon = {
        "",
        "",
        "",
      }

      local ms = vim.loop.hrtime() / 1000000
      local frame = math.floor(ms / 120) % #spinners

      if percentage >= 70 then
        return string.format(
          " %%<%s %s %s (%s%%%%) ",
          success_icon[frame + 1],
          title,
          msg,
          percentage
        )
      else
        return string.format(
          " %%<%s %s %s (%s%%%%) ",
          spinners[frame + 1],
          title,
          msg,
          percentage
        )
      end
    end
    return ""
  end,
  hl = { fg = colors.green },
}

components.active[3][1] = {
  provider = function()
    if next(vim.lsp.buf_get_clients()) ~= nil then
      -- return "  LSP"
      return statusline_style.main_icon
    else
      return "" .. statusline_style.main_icon .. "NO LSP  "
    end
  end,

  hl = function()
    if next(vim.lsp.buf_get_clients()) ~= nil then
      return { fg = colors.white , bg = colors.statusline_bg }
    end

    if next(vim.lsp.buf_get_clients()) == nil then
      return { fg = colors.red, bg = colors.statusline_bg }
    end
  end
}

local chad_mode_hl = function()
  return {
    fg = mode_colors[vim.fn.mode()][2],
    bg = colors.statusline_bg,
  }
end

components.active[3][2] = {
  provider = function()
    return " " .. mode_colors[vim.fn.mode()][1] .. " "
  end,
  hl = chad_mode_hl,
}

-- components.active[3][7] = {
--   provider = statusline_style.left,
--   hl = {
--     fg = colors.grey,
--     bg = colors.statusline_bg,
--   },
-- }

-- components.active[3][8] = {
--   provider = statusline_style.left,
--   hl = {
--     fg = colors.green,
--     bg = colors.statusline_bg,
--   },
-- }

-- components.active[3][9] = {
--   provider = statusline_style.position_icon,
--   hl = {
--     fg = colors.statusline_bg,
--     bg = colors.white,
--   },
-- }
--
--
components.active[3][3] = {
  provider = function()
    local current_line = vim.fn.line(".")
    local total_line = vim.fn.line("$")

    if current_line == 1 then
      return " TOP "
    elseif current_line == vim.fn.line("$") then
      return " BOT "
    end
    local result, _ = math.modf((current_line / total_line) * 100)
    return " " .. result .. "%% "
  end,

  hl = {
    fg = colors.white,
    bg = colors.statusline_bg,
  },
}





-- components.active[1][1] = edit_mode_icon

components.inactive = components.active


require("feline").setup({
  colors = {
    bg = colors.statusline_bg,
    fg = colors.fg,
  },
  components = components,
})
