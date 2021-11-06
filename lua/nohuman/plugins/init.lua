require("packer")

require("nohuman.plugins.list")
require("nohuman.plugins.config")


function PluginsSync()
  require'packer'.sync()
end
