local fun = require 'functional'


local logger = { }
logger.__index = logger


local DEFAULT_LOG_LEVEL = 3

local levels = { 'trace', 'debug', 'info', 'warn', 'error' }

local function log(level, name, message)
  print('['..level..' '..os.date('%c')..'] ['..name..'] '..tostring(message))
end


function logger.new(name, level)
  local self = { }
  setmetatable(self, logger)

  self._name = name
  self._level = level or DEFAULT_LOG_LEVEL

  fun.foreach2(levels, function(i, v)
    self[v] = function(message)
      if self._level < i then return end
      log(string.upper(v), self._name, message)
    end
  end)

  return self
end


function logger:setlevel(level)
  self._level = level
end


function logger:level()
  return self._level
end


return logger
