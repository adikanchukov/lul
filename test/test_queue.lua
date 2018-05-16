package.path = package.path..';../?.lua'


local test = require 'test'
local queue = require 'queue'


test.new('queue', 'emptynew', function(self)
  local q = queue.new()

  self.assert(q:empty())
  self.eq(q:count(), 0)
end)


test.new('queue', 'new', function(self)
  local q = queue.new({ 1, 2, 3 })

  self.assert(not q:empty())
  self.eq(q:count(), 3)
end)


test.new('queue', 'front', function(self)
  local q = queue.new({ 1, 2, 3 })

  self.assert(q:front(), 1)
end)


test.new('queue', 'back', function(self)
  local q = queue.new({ 1, 2, 3 })

  self.assert(q:back(), 3)
end)


test.new('queue', 'push', function(self)
  local q = queue.new()
  local expected = 42

  q:push(expected)

  self.eq(q:count(), 1)
  self.eq(q:front(), expected)
end)


test.new('queue', 'pop', function(self)
  local q = queue.new({ 1, 2, 3 })

  self.eq(q:pop(), 1)
  self.eq(q:pop(), 2)
  self.eq(q:pop(), 3)
  self.assert(q:empty())
end)


test.new('queue', 'clear', function(self)
  local q = queue.new({ 1, 2, 3 })

  q:clear()

  self.assert(q:empty())
end)


test.runscope('queue')
