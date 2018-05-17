local typeinfo = require 'typeinfo'


local _error = error
local _assert = assert

local error = { }
error.__index = error


function assert(expr, err)
  if not expr then
    pcall(typeinfo.isstring(err) and function() _error(err) end or err())
  end
end


function error.logic(message)
  return function() _error('logic error: '..message) end
end


function error.notimplemented(message)
  return function() _error('not implemented: '..message) end
end


function error.notsupported(message)
  return function() _error('not supported: '..message) end
end


function error.argument(name, arg)
  return function() _error('argument error: { '..name..', '..tostring(arg)..' }') end
end


function error.type(expected, arg)
  return function() _error('type error: expected '..expected..', got '..type(arg)) end
end


function error.nilval(message)
  return function() _error('nil error: '..message) end
end


function error.outofrange(index, size)
  return function() _error('out of range error: { '..index..', '..size..' }') end
end


return error
