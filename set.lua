local fun = require 'functional'

local set = { }
set.__index = set


function set.new(t)
  local self = { }
  setmetatable(self, set)

  self._values = { }
  self._indices = { }
  if t then self:add2(t) end

  return self
end


function set:add(val)
  if self._indices[val] then return false end
  table.insert(self._values, val)
  self._indices[val] = fun.count(self._values)

  return true
end


function set:add2(t)
  fun.foreach(t, function(v) self:add(v) end)
end


function set:remove(val)
  if not self._indices[val] then return false end
  table.remove(self._values, self._indices[val])
  self._indices[val] = nil

  return true
end


function set:remove2(t)
  fun.foreach(t, function(v) self:remove(v) end)
end


function set:removeif(func)
  local removevalues = fun.filter(self._values, func)
  self:remove2(removevalues)
end


function set:contains(val)
  return self._indices[val]
end


function set:clear()
  fun.clear(self._values)
  fun.clear(self._indices)
end


function set:count()
  return fun.count(self._values)
end


function set:empty()
  return fun.empty(self._values)
end


function set:values()
  return self._values
end


return set
