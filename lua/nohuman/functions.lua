local f = function()
  local variavel = 5
  print(variavel)
end

function GlobalFunction()
  local position_params = vim.lsp.util.make_position_params()
  local renamed = vim.fn.input("New Name for Nicks's thing: ")

  position_params.newName = renamed

  vim.lsp.buf_request(0, "textDocument/rename", position_params, function(err, method, result, ...)
    print(err,method, result)

    print "calling rename ..."

    vim.lsp.handlers["textDocument/rename"](err, method, result, ...)

    print ("...done with rename " .. renamed)
  end)
end

P = function(v)
  return v
end

RELOAD  = function(...)
  return require("pllenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

