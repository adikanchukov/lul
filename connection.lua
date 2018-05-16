local connection = { }
connection.__index = connection


function connection.new(removehandler)
  local self = { }
  setmetatable(self, connection)

  self._removehandler = removehandler

  return self
end


function connection:disconnect()
  if not self._removehandler then return end

  self._removehandler()
  self._removehandler = nil
end


function connection:connected()
  return self._removehandler
end


return connection
