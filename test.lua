local fun = require 'functional'


local test = { }

local alltests = { }

local function resultstring(result)
  return result and 'OK' or 'FAILED'
end


function test.new(scope, name, func)
  local self = { }
  setmetatable(self, test)

  self._scope = scope
  self._name = name
  self._func = func
  self._passed = true
  self._errors = { }

  self.eq = function(l, r)
    if l ~= r then
      table.insert(self._errors, tostring(l).. ' ~= '..tostring(r))
      self._passed = false
    end
  end

  self.ne = function(l, r)
    if l == r then
      table.insert(self._errors, tostring(l)..' == '..tostring(r))
      self._passed = false
    end
  end

  self.assert = function(val, message)
    if not val then
      local log = 'assertion failed'
      if message then log = log..': '..message end
      table.insert(self._errors, log)
      self._passed = false
    end
  end

  if not alltests[scope] then alltests[scope] = { } end
  table.insert(alltests[scope], self)
end


function test.runscope(scope)
  print()

  if not alltests[scope] then
    print('coundn\'t find '..scope..' test(s)')
    return
  end

  local testcount = fun.count(alltests[scope])
  print(scope..': running '..testcount..' test(s)...')

  local failedcount = 0
  fun.foreach(alltests[scope], function(val)
    val._func(val)

    print('[ '..resultstring(val._passed)..' ] '..scope..'.'..val._name)
    fun.foreach(val._errors, function(error) print(error) end)

    if not val._passed then failedcount = failedcount + 1 end
  end)

  if failedcount == 0 then print(scope..': '..testcount..' test(s) passed')
  else print(scope..': '..failedcount..' TEST(S) FAILED') end
end


function test.runall()
  fun.foreach(alltests, function(val) test.runscope(val._scope) end)
end


return test
