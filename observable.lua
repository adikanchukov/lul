local fun = require 'functional'
local signal = require 'signal'


local observable = { }
observable.__index = observable


function observable.new(value)
  local self = { }
  setmetatable(self, observable)

  self._value = value
  self._changed = signal.new(function(handler) handler(self._value) end)

  return self
end


function observable:get()
  return self._value
end


function observable:set(value)
  if self._value == value then return end

  self._value = value
  self._changed:emit(value)
end


function observable:onchanged()
  return self._changed
end


function observable:lock()
  self._changed:lock()
end


function observable:unlock()
  self._changed:unlock()
end


function observable:locked()
  self._changed:locked()
end


function observable:__tostring()
  return self._value
end


return observable
