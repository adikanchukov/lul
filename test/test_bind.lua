package.path = package.path..';../?.lua'


local test = require 'test'
require 'bind'


test.new('bind', 'bind', function(self)
  local h = function(a) return a * a end
  local f = bind(h, 3)

  self.eq(f(), 9)
end)


test.new('bind', 'bind2', function(self)
  local h = function(a, b) return a + b end
  local f = bind2(h, { 3, 2 })

  self.eq(f(), 5)
end)


test.new('bind', 'bind3', function(self)
  local h = function(a, b, c) return a + b + c end
  local f = bind3(h, { 3, 2, 3 })

  self.eq(f(), 8)
end)


test.new('bind', 'bind4', function(self)
  local h = function(a, b, c, d) return a + b + c + d end
  local f = bind4(h, { 3, 2, 3, 5 })

  self.eq(f(), 13)
end)


test.new('bind', 'bind5', function(self)
  local h = function(a, b, c, d, e) return a + b + c + d + e end
  local f = bind5(h, { 3, 2, 3, 5, 5 })

  self.eq(f(), 18)
end)


test.runscope('bind')
