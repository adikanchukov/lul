local queue = require 'queue'


local taskexecutor = { }
taskexecutor.__index = taskexecutor


function taskexecutor.new()
  local self = { }
  setmetatable(self, taskexecutor)

  self._taskqueue = queue.new()

  return self
end


function taskexecutor:addtask(task)
  if not task then return end
  self._taskqueue:push(task)
end


function taskexecutor:execute()
  while not self._taskqueue:empty() do
    self._taskqueue:pop()()
  end
end


function taskexecutor:clear()
  self._taskqueue:clear()
end


function taskexecutor:count()
  return self._taskqueue:count()
end


return taskexecutor
