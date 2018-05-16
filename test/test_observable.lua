package.path = package.path..';../?.lua'


local test = require 'test'
local observable = require 'observable'


test.new('observable', 'emptynew', function(self)
  local ob = observable.new()

  self.assert(not ob:get())
end)


test.new('observable', 'new', function(self)
  local expected = 42
  local ob = observable.new(expected)

  self.eq(ob:get(), expected)
end)


test.new('observable', 'onchanged', function(self)
  local ob = observable.new(42)
  local result

  ob:onchanged():connect(function(val) result = val end)

  self.eq(ob:get(), result)
end)


test.new('observable', 'set', function(self)
  local ob = observable.new(42)
  local updated = 0

  ob:onchanged():connect(function() updated = updated + 1 end)
  self.eq(updated, 1)

  ob:set(32)
  self.eq(ob:get(), 32)
  self.eq(updated, 2)

  ob:set(32)
  self.eq(updated, 2)
end)


test.runscope('observable')
