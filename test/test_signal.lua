package.path = package.path..';../?.lua'


local test = require 'test'
local signal = require 'signal'


test.new('signal', 'new', function(self)
  local s = signal.new()
  self.assert(not s:locked(), 'locked by default')
end)


test.new('signal', 'populator', function(self)
  local result
  local expected = 42
  local s = signal.new(function(val) result = expected end)

  s:connect(function() end)

  self.eq(result, expected)
end)


test.new('signal', 'connect', function(self)
  local s = signal.new()
  self.assert(not s:connect(), 'connection returned')
  self.assert(s:connect(function() end), 'no connection returned')
end)


test.new('signal', 'emit', function(self)
  local s = signal.new()
  local result
  local expected = 42

  s:connect(function(val) result = val end)
  s:emit(expected)

  self.eq(result, expected)
end)


test.new('signal', 'multipleconnect', function(self)
  local s = signal.new()
  local result1, result2
  local expected = 42

  s:connect(function(val) result1 = val end)
  s:connect(function(val) result2 = val end)
  s:emit(expected)

  self.eq(result1, expected)
  self.eq(result2, expected)
end)


test.new('signal', 'lockunlock', function(self)
  local s = signal.new()
  local result
  local expected = 42

  s:connect(function(val) result = val end)
  s:lock()

  self.assert(s:locked(), 'not locked')
  s:emit(expected)
  self.assert(not result, 'lock doesn\'t work')

  s:unlock()
  s:emit(expected)
  self.eq(result, expected)
end)


test.new('signal', 'disconnect', function(self)
  local s = signal.new()
  local result
  local handler = function() result = 42 end

  s:connect(handler)
  s:disconnect(handler)
  s:emit()

  self.assert(not result, 'signal emitted')
end)


test.runscope('signal')
