local optional = { }
optional.__index = optional


function optional.new(val)
  local self = { }
  setmetatable(self, optional)

  self._value = val
  self._initialized = val and true or false

  return self
end


function optional:get()
  if not self._initialized then error('not initialized') end --TODO
  return self._value
end


function optional:getvalueor(val)
  if not self._initialized then return val end
  return self._value
end


function optional:set(val)
  self._initialized = true
  self._value = val
end


function optional:reset()
  self._initialized = false
  self._value = nil
end


function optional:initialized()
  return self._initialized
end


function optional:__tostring()
  if self._initialized then return self._value end
  return 'not initialized' --TODO
end


return optional
