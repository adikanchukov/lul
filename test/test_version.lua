package.path = package.path..';../?.lua'


local version = require 'version'
local test = require 'test'


test.new('version', 'test', function(self)
  local v = version.new(1, 2, 3)

  self.eq(v:major(), 1)
  self.eq(v:minor(), 2)
  self.eq(v:patch(), 3)
end)


test.runscope('version')
