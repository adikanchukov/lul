local fun = require 'functional'
local typeinfo = require 'typeinfo'


local cli = { }
cli.__index = cli


function cli.cli(object)
  if arg[1] then
      local func = arg[1]

      if func == '--help' or func == '-h' then
        fun.foreach(fun.keys(
          fun.filter(object, function(v)
            return typeinfo.isfunction(v) end)),
              function(f) print(f) end)
        return
      end

      if not object[func] then
        print('No such command: '..tostring(func))
        print('Use -h or --help to print all available commands')
        return
      end

      if not typeinfo.isfunction(object[func]) then
        print(tostring(func)..' is not a function')
        return
      end

      table.remove(arg, 1)
      object[func](table.unpack(arg))
  end
end


return cli
