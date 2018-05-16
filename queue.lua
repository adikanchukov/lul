local fun = require 'functional'


local queue = { }
queue.__index = queue


function queue.new(values)
  local self = { }
  setmetatable(self, queue)

  self._values = values or { }

  return self
end


function queue:push(val)
  if not val then return end
  table.insert(self._values, val)
end


function queue:pop()
  if fun.empty(self._values) then return nil end

  local result = self._values[1]
  table.remove(self._values, 1)

  return result
end


function queue:count()
  return fun.count(self._values)
end


function queue:empty()
  return fun.empty(self._values)
end


function queue:front()
  return self._values[1]
end


function queue:back()
  return self._values[fun.count(self._values)]
end


function queue:clear()
  fun.clear(self._values)
end


return queue
