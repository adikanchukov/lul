package.path = package.path..';../?.lua'


local test = require 'test'
local fun = require 'functional'
local set = require 'set'


test.new('set', 'emptynew', function(self)
  local s = set.new()

  self.eq(s:count(), 0)
  self.assert(s:empty())
end)


test.new('set', 'new', function(self)
  local s = set.new({1, 2, 3})

  self.eq(s:count(), 3)
  self.assert(not s:empty())
end)


test.new('set', 'add', function(self)
  local s = set.new()
  local expected = 42

  self.assert(s:add(expected))
  self.assert(not s:add(expected))
end)


test.new('set', 'add2', function(self)
  local s = set.new()
  local expected = { 1, 2, 2, 3 }

  s:add2(expected)
  fun.foreach(expected, function(val)
    self.assert(s:contains(val))
  end)
end)


test.new('set', 'remove', function(self)
  local s = set.new({1, 2, 3})

  self.assert(s:remove(1))
  self.assert(not s:remove(42))
  self.eq(s:count(), 2)
end)


test.new('set', 'remove2', function(self)
  local s = set.new({1, 2, 3, 4, 5})

  s:remove2({1, 2, 3})

  self.assert(s:contains(4))
  self.assert(not s:contains(1))
  self.eq(s:count(), 2)
end)


test.new('set' ,'removeif', function(self)
  local s = set.new({1, 2, 3, 4, 5})

  s:removeif(function(val) return val < 3 end)

  self.assert(s:contains(4))
  self.assert(not s:contains(2))
  self.eq(s:count(), 3)
end)


test.new('set' ,'clear', function(self)
  local s = set.new({1, 2, 3, 4, 5})

  s:clear()

  self.assert(s:empty())
  self.eq(s:count(), 0)
end)


test.runscope('set')
