local fun = { }


function fun.foreach(t, func)
  for i, v in pairs(t) do func(v) end
end


function fun.foreach2(t, func)
  for i, v in pairs(t) do func(i, v) end
end


function fun.map(t, func)
  local result = { }
  fun.foreach2(t, function(i, v) result[i] = func(v) end)
  return result
end


function fun.filter(t, func)
  local result = { }
  fun.foreach2(t, function(i, v)
    if func(v) then result[i] = v end
  end)
  return result
end


function fun.reduce(t, func)
  local result = t[1]
  fun.foreach(t, function(v)
    result = func(result, v)
  end)
  return result
end


function fun.reduce2(t, val, func)
  local result = val
  fun.foreach(t, function(v)
    result = func(result, v)
  end)
  return result
end


function fun.find(t, val)
  for i, v in pairs(t) do
    if v == val then return i end
  end

  return nil
end


function fun.count(t)
  local count = 0
  fun.foreach(t, function() count = count + 1 end)
  return count
end


function fun.empty(t)
  return fun.count(t) == 0
end


function fun.remove(t, val)
  local result = { }

  for i = #t, 1, -1 do
    if t[i] == val then
      table.remove(t, i)
      table.insert(result, i)
    end
  end

  return result
end


function fun.removeif(t, func)
  for i = #t, 1, -1 do
    if func(t[i]) then table.remove(t, i) end
  end
end


function fun.clear(t)
  for i = #t, 1, -1 do t[i] = nil end
end


function fun.copy1(t)
  local result = { }

  for i, v in pairs(t) do result[i] = v end
  setmetatable(result, getmetatable(t))

  return result
end


function fun.keys(t)
  local result = { }
  fun.foreach2(t, function(i) table.insert(result, i) end)
  return result
end


function fun.values(t)
  local result = { }
  fun.foreach(t, function(v) table.insert(result, v) end)
  return result
end


return fun
