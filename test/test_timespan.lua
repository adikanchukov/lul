package.path = package.path..';../?.lua'


local timespan = require 'timespan'
local test = require 'test'


test.new('timespan', 'constructors', function(self)
  ts = timespan.second()
  self.eq(ts:seconds(), 1)

  ts = timespan.minute()
  self.eq(ts:minutes(), 1)

  ts = timespan.hour()
  self.eq(ts:hours(), 1)

  ts = timespan.day()
  self.eq(ts:days(), 1)

  ts = timespan.week()
  self.eq(ts:weeks(), 1)


  local expected = 42

  ts = timespan.fromseconds(expected)
  self.eq(ts:seconds(), expected)

  ts = timespan.fromminutes(expected)
  self.eq(ts:minutes(), expected)

  ts = timespan.fromhours(expected)
  self.eq(ts:hours(), expected)

  ts = timespan.fromdays(expected)
  self.eq(ts:days(), expected)

  ts = timespan.fromweeks(expected)
  self.eq(ts:weeks(), expected)
end)


test.new('timespan', 'operators', function(self)
  local l = timespan.fromseconds(14)
  local r = timespan.fromseconds(42)

  r = r + l
  self.eq(r:seconds(), 56)

  r = r / 2
  self.eq(r:seconds(), 28)

  r = r * 2
  self.eq(r:seconds(), 56)

  self.assert(l ~= r)
  self.assert(l < r)
  self.assert(l <= r)
end)


test.runscope('timespan')
