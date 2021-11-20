require("packer")

require("nohuman.plugins.list")
require("nohuman.plugins.config")
require("nohuman.plugins.config")
require("nohuman.plugins.colorPicker")

require('telescope').load_extension('neoclip')




function PluginsSync()
  require'packer'.sync()
end
