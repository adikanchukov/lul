function maketuple(t)
  return setmetatable({ }, {
    __index = t,
    __newindex = function(t, i, v) error('\'tuple\' cannot be modified') end,
    __metatable = false,
  })
end
