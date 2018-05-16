function bind(func, ...)
  local args = { ... }
  return function() return func(table.unpack(args)) end
end
