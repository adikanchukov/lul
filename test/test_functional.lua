package.path = package.path..';../?.lua'


local fun = require 'functional'
local test = require 'test'


test.new('functional', 'foreach', function(self)
  local t = { 1, 2, 3 }
  local result = 0

  fun.foreach(t, function(v) result = result + v end)

  self.eq(result, 6)
end)


test.new('functional', 'foreach2', function(self)
  local t = { 1, 2, 3 }
  local result = 0

  fun.foreach2(t, function(i, v) result = result + i + v end)

  self.eq(result, 12)
end)


test.new('functional', 'map', function(self)
  local t = { 2, 3, 4 }

  local result = fun.map(t, function(v) return v * v end)

  self.eq(result[1], 4)
  self.eq(result[2], 9)
  self.eq(result[3], 16)
end)


test.new('functional', 'filter', function(self)
  local t = { 1, 2, 3 }

  local result = fun.filter(t, function(v) return v < 2 end)

  self.eq(fun.count(result), 1)
  self.assert(fun.find(result, 1))
  self.assert(not fun.find(result, 3))
end)


test.new('functional', 'reduce', function(self)
  self.eq(fun.reduce({ 1, 2, 3 }, function(l, r) return l + r end), 7)
end)


test.new('functional', 'reduce2', function(self)
  self.eq(fun.reduce2({ 1, 2, 3 }, 0, function(l, r) return l + r end), 6)
end)


test.new('functional', 'find', function(self)
  local t = { 1, 2, 4 }

  self.assert(fun.find(t, 1))
  self.assert(not fun.find(t, 5))
  self.eq(fun.find(t, 4), 3)
end)


test.new('functional', 'count', function(self)
  self.eq(fun.count({1, 2, nil, 3}), 3)
end)


test.new('functional', 'empty', function(self)
  self.assert(fun.empty({ }))
  self.assert(not fun.empty({ 1 }))
end)


test.new('functional', 'remove', function(self)
  local t = { 1, 2, 3, 2 }

  local removed = fun.remove(t, 2)

  self.assert(not fun.find(t, 2))
  self.eq(fun.count(removed), 2)
  self.assert(fun.find(removed, 2))
  self.assert(fun.find(removed, 4))
end)


test.new('functional', 'removeif', function(self)
  local t = { 1, 2, 3, 1 }

  fun.removeif(t, function(v) return v < 3 end)

  self.eq(fun.count(t), 1)
  self.assert(not fun.find(t, 1))
  self.assert(not fun.find(t, 2))
end)


test.new('functional', 'clear', function(self)
  local t = { 1, 2, 3, { 1, 2 } }

  fun.clear(t)

  self.assert(fun.empty(t))
end)


test.new('functional', 'keys', function(self)
  local t = { 2, 4, c = 6 }

  local keys = fun.keys(t)

  self.eq(fun.count(keys), 3)
  self.assert(fun.find(keys, 1))
  self.assert(fun.find(keys, 2))
  self.assert(fun.find(keys, 'c'))
end)


test.new('functional', 'values', function(self)
  local v = { 1 }
  local t = { a = 2, b = 4, c = v }

  local values = fun.values(t)

  self.eq(fun.count(values), 3)
  self.assert(fun.find(values, 2))
  self.assert(fun.find(values, 4))
  self.assert(fun.find(values, v))
end)


test.runscope('functional')
