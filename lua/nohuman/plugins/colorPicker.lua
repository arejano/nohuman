local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"
local themes = require "telescope.themes"
local TelescopeDropDown = require "telescope.themes".get_dropdown()

function enter(prompt_bufnr)
  local selected = action_state.get_selected_entry()
  local cmd = 'colorscheme ' .. selected[1]
  vim.cmd(cmd)
  actions.close(prompt_bufnr)
end

function next_color(prompt_bufnr)
  local selected = action_state.get_selected_entry()
  local cmd = 'colorscheme ' .. selected[1]
  vim.cmd(cmd)
  actions.move_selection_next(prompt_bufnr)
end


function prev_color(prompt_bufnr)
  local selected = action_state.get_selected_entry()
  local cmd = 'colorscheme ' .. selected[1]
  vim.cmd(cmd)
  actions.move_selection_previous(prompt_bufnr)
end



local opts = {

  finder = finders.new_table {"nightfox","desert"},
  sorter = sorters.get_generic_fuzzy_sorter({}),

  attach_mappings = function(prompt_bufnr, map)
    map("i", "<CR>", enter)
    map("i", "<C-J>", next_color)
    map("i", "<C-K>", prev_color)
    return true
  end,

}

-- local dropdown = themes.get_dropdown()
-- local ivy = themes.get_ivy()
-- local cursor = themes.get_cursor()


local colors =  pickers.new(TelescopeDropDown, opts)


function FindColors()
  colors:find()
end
