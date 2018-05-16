package.path = package.path..';../?.lua'


local typeinfo = require 'typeinfo'
local test = require 'test'


test.new('typeinfo', 'isnumber', function(self)
  self.assert(typeinfo.isnumber(1))
  self.assert(typeinfo.isnumber(1.))
  self.assert(typeinfo.isnumber(-1.))
  self.assert(not typeinfo.isnumber({ }))
end)


test.new('typeinfo', 'isint', function(self)
  self.assert(typeinfo.isint(1))
  self.assert(typeinfo.isint(-1))
  self.assert(not typeinfo.isint(-1.2))
end)


test.new('typeinfo', 'isfloat', function(self)
  self.assert(typeinfo.isfloat(1.2))
  self.assert(typeinfo.isfloat(-1.2))
  self.assert(not typeinfo.isfloat(0))
end)


test.new('typeinfo', 'istable', function(self)
  self.assert(typeinfo.istable({ }))
  self.assert(typeinfo.istable({ 1 }))
  self.assert(not typeinfo.istable(0))
end)


test.new('typeinfo', 'isfunction', function(self)
  self.assert(typeinfo.isfunction(function() end))
  self.assert(not typeinfo.isfunction({ }))
end)


test.new('typeinfo', 'isnil', function(self)
  self.assert(typeinfo.isnil(nil))
  local r
  self.assert(typeinfo.isnil(r))
  self.assert(not typeinfo.isnil({ }))
end)


test.new('typeinfo', 'isstring', function(self)
  self.assert(typeinfo.isstring(''))
  self.assert(typeinfo.isstring(tostring({ })))
  self.assert(not typeinfo.isstring(42))
end)


test.new('typeinfo', 'equals', function(self)
  self.assert(typeinfo.equals(nil, nil))
  self.assert(typeinfo.equals({ }, { }))
  self.assert(typeinfo.equals(function() end, function() end))
  self.assert(typeinfo.equals(2, 1))
  self.assert(typeinfo.equals('', ''))
  self.assert(typeinfo.equals(2.5, 1.3))
  self.assert(typeinfo.equals(2.5, 1.3))
  self.assert(not typeinfo.equals(2, 1.3))
  self.assert(not typeinfo.equals(2.5, 1))
end)


test.runscope('typeinfo')
