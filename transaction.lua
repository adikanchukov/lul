local stack = require 'stack'


local transaction = { }
transaction.__index = transaction


function transaction.new()
  local self = { }
  setmetatable(self, transaction)

  self._rollbackstack = stack.new()
  self._complete = false

  return self
end


function transaction:execute(action, rollback)
  if self._complete then return end

  action()

  if rollback then self._rollbackstack:push(rollback) end
end


function transaction:commit()
  self._complete = true
end


function transaction:rollback()
  if self._complete then return end

  while not self._rollbackstack:empty() do self._rollbackstack:pop()() end

  self._complete = true
end


function transaction:complete()
  return self._complete
end


function transaction:reset()
  self._rollbackstack:clear()
  self._complete = false
end


return transaction
