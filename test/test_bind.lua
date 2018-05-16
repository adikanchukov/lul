package.path = package.path..';../?.lua'


local test = require 'test'
require 'bind'


test.new('bind', 'bind', function(self)
  local h = function(x, y) return x + y end
  local f = bind(h, 3, 5)

  self.eq(f(), 8)
end)


test.runscope('bind')
