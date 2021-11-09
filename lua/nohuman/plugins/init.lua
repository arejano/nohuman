require("packer")

require("nohuman.plugins.list")
require("nohuman.plugins.config")
require("nohuman.plugins.config")
require("nohuman.plugins.colorPicker")


function PluginsSync()
  require'packer'.sync()
end
