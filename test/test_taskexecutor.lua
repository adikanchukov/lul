package.path = package.path..';../?.lua'


local taskexecutor = require 'taskexecutor'
local fun = require 'functional'
local test = require 'test'


test.new('taskexecutor', 'new', function(self)
  local executor = taskexecutor.new()

  self.eq(executor:count(), 0)
end)


test.new('taskexecutor', 'addtask', function(self)
  local executor = taskexecutor.new()

  executor:addtask(function() return 42 end)

  self.eq(executor:count(), 1)
end)


test.new('taskexecutor', 'execute', function(self)
  local executor = taskexecutor.new()
  local result = 0

  for i = 1, 5 do executor:addtask(function() result = result + 1 end) end
  executor:execute()

  self.eq(result, 5)
  self.eq(executor:count(), 0)
end)


test.runscope('taskexecutor')
