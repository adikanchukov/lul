package.path = package.path..';../?.lua'


local test = require 'test'
local optional = require 'optional'


test.new('optional', 'new', function(self)
  local op = optional.new()


  self.assert(not op:getvalueor())
  self.assert(not op:initialized())
end)


test.new('optional', 'get', function(self)
  local expected = 42
  local op = optional.new(expected)

  self.eq(op:get(), expected)
end)


test.new('optional' ,'getvalue', function(self)
  local expected = 42
  local op = optional.new(expected)

  self.eq(op:getvalueor(13), expected)
end)


test.new('optional', 'getvalueor', function(self)
  local op = optional.new()
  local expected = 42

  self.eq(op:getvalueor(expected), expected)
end)


test.new('optional' ,'reset', function(self)
  local op = optional.new(42)
  local expected = 13

  op:reset()

  self.eq(op:getvalueor(expected), expected)
  self.assert(not op:initialized())
end)


test.new('optional', 'set', function(self)
  local op = optional.new()
  local expected = 42

  op:set(expected)

  self.assert(op:initialized())
  self.eq(op:get(), expected)
end)


test.new('optional', 'tostring', function(self)
  local op = optional.new()

  self.eq('not initialized', tostring(op))

  op:set(42)
  self.eq('42', tostring(op))
end)


test.runscope('optional')
