local fun = require 'functional'


local stack = { }
stack.__index = stack


function stack.new(t)
  local self = { }
  setmetatable(self, stack)

  self._values = t or { }

  return self
end


function stack:push(val)
  if not val then return end

  table.insert(self._values, val)
end


function stack:pop()
  local index = fun.count(self._values)
  local result = self._values[index]
  table.remove(self._values, index)

  return result
end


function stack:top()
  return self._values[fun.count(self._values)]
end


function stack:count()
  return fun.count(self._values)
end


function stack:empty()
  return fun.empty(self._values)
end


function stack:clear()
  fun.clear(self._values)
end


return stack
