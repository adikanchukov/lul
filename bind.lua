function bind(func, arg)
  return function() return func(arg) end
end


function bind2(func, args)
  return function() return func(args[1], args[2]) end
end


function bind3(func, args)
  return function() return func(args[1], args[2], args[3]) end
end


function bind4(func, args)
  return function() return func(args[1], args[2], args[3], args[4]) end
end


function bind5(func, args)
  return function() return func(args[1], args[2], args[3], args[4], args[5]) end
end
