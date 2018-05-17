package.path = package.path..';../?.lua'


local transaction = require 'transaction'
local test = require 'test'


test.new('transaction', 'new', function(self)
  local tr = transaction.new()

  self.assert(not tr:complete())
end)


test.new('transaction', 'execute', function(self)
  local tr = transaction.new()
  local result
  local expected = 42

  tr:execute(function() result = expected end)
  self.eq(result, expected)
end)


test.new('transaction', 'commit', function(self)
  local tr = transaction.new()
  local result = 0

  tr:execute(function() result = 42 end)
  tr:commit()

  self.assert(tr:complete())
end)


test.new('transaction', 'rollback', function(self)
  local tr = transaction.new()
  local result = 0

  tr:execute(function()  end, function() result = result * 5 end)
  tr:execute(function()  end, function() result = result + 10 end)
  tr:rollback()

  self.eq(result, 50)
end)


test.new('transaction', 'reset', function(self)
  local tr = transaction.new()

  tr:execute(function()  end)
  tr:commit()
  tr:reset()

  self.assert(not tr:complete())
end)


test.runscope('transaction')
