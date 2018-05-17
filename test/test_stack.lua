package.path = package.path..';../?.lua'


local stack = require 'stack'
local test = require 'test'


test.new('stack', 'emptynew', function(self)
  local s = stack.new()

  self.assert(s:empty())
  self.eq(s:count(), 0)
end)


test.new('stack', 'new', function(self)
  local s = stack.new({ 1, 2, 3 })

  self.assert(not s:empty())
  self.eq(s:count(), 3)
end)


test.new('stack', 'top', function(self)
  local s = stack.new({ 1, 2, 3 })

  self.eq(s:top(), 3)
end)


test.new('stack', 'pop', function(self)
  local expected = 42
  local s = stack.new({ 1, 2, expected })

  local result = s:pop()

  self.eq(s:count(), 2)
  self.eq(result, expected)
end)


test.new('stack', 'push', function(self)
  local s = stack.new({ 1, 2 })
  local expected = 42

  s:push(expected)

  self.eq(s:count(), 3)
  self.eq(s:pop(), expected)
end)


test.new('stack', 'clear', function(self)
  local s = stack.new({ 1, 2 })

  s:clear()

  self.assert(s:empty())
  self.eq(s:count(), 0)
end)


test.runscope('stack')
