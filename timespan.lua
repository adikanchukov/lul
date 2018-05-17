local timespan = { }


timespan.__index = timespan

timespan.__add = function(l, r)
  return setmetatable({ _seconds = l._seconds + r._seconds }, timespan)
end

timespan.__div = function(l, r)
  return setmetatable({ _seconds = l._seconds / r }, timespan)
end

timespan.__mul = function(l, r)
  return setmetatable({ _seconds = l._seconds * r }, timespan)
end

timespan.__eq = function (l, r)
  return l._seconds == r.__seconds
end

timespan.__lt = function (l, r)
  return l._seconds < r._seconds
end

timespan.__le = function (l, r)
  return l._seconds <= r._seconds
end

timespan.__tostring = function(val)
  return self._seconds..' seconds' --TODO hh:mm:ss
end


function timespan.fromseconds(seconds)
  local self = { }
  setmetatable(self, timespan)

  self._seconds = seconds

  return self
end


function timespan:seconds()
  return self._seconds
end


function timespan:minutes()
  return self:seconds() / 60
end


function timespan:hours()
  return self:minutes() / 60
end

function timespan:days()
  return self:hours() / 24
end


function timespan:weeks()
  return self:days() / 7
end


function timespan.second()
  return timespan.fromseconds(1)
end


function timespan.minute()
  return timespan.second() * 60
end


function timespan.hour()
  return timespan.minute() * 60
end


function timespan.day()
  return timespan.hour() * 24
end


function timespan.week()
  return timespan.day() * 7
end


function timespan.fromminutes(minutes)
  return timespan.minute() * minutes
end


function timespan.fromhours(hours)
  return timespan.hour() * hours
end


function timespan.fromweeks(weeks)
  return timespan.week() * weeks
end


function timespan.fromdays(days)
  return timespan.day() * days
end


return timespan
