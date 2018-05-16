local typeinfo = { }
typeinfo.__index = typeinfo


function typeinfo.istype(val, t)
  return type(val) == t
end


function typeinfo.isnumber(val)
  return typeinfo.istype(val, 'number')
end


function typeinfo.isint(val)
  return typeinfo.isnumber(val) and not string.find(val, '%.')
end


function typeinfo.isfloat(val)
  return typeinfo.isnumber(val) and string.find(val, '%.')
end


function typeinfo.istable(val)
  return typeinfo.istype(val, 'table')
end


function typeinfo.isfunction(val)
  return typeinfo.istype(val, 'function')
end


function typeinfo.isnil(val)
  return typeinfo.istype(val, 'nil')
end


function typeinfo.isstring(val)
  return typeinfo.istype(val, 'string')
end


function typeinfo.equals(l, r)
  if typeinfo.isnumber(l) and typeinfo.isnumber(r) then
    if typeinfo.isint(l) then return typeinfo.isint(r) end
    if typeinfo.isfloat(l) then return typeinfo.isfloat(r) end
  end

  return type(l) == type(r)
end


return typeinfo
