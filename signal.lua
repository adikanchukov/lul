local fun = require 'functional'
local connection = require 'connection'
local set = require 'set'


local signal = { }
signal.__index = signal


function signal.new(populator)
  local self = { }
  setmetatable(self, signal)

  self._handlers = set.new()
  self._populator = populator

  return self
end


function signal:connect(handler)
  if not handler then return nil end
  if self._populator then self._populator(handler) end

  self._handlers:add(handler)

  return connection.new(function() self._handlers:remove(handler) end)
end


function signal:disconnect(handler)
  self._handlers:remove(handler)
end


function signal:emit(...)
  if self:locked() then return end

  local args = { ... }
  fun.foreach(self._handlers:values(), function(handler)
    handler(table.unpack(args))
  end)
end


function signal:lock()
  self._locked = true
end


function signal:unlock()
  self._locked = false
end


function signal:locked()
  return self._locked
end


return signal
