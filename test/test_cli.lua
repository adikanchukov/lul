package.path = package.path..';../?.lua'


local cli = require 'cli'


local Calculator = {
  me = 5,
  double = function(x)
    print(x * x)
  end,
  sum = function(l, r)
    print(l + r)
  end,
  abort = function()
    error('Aborted')
  end
}

cli.cli(Calculator)
