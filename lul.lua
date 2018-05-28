local lul = { }
lul.__index = lul


lul.error = require 'error'
require 'bind'
require 'tuple'

lul.fun = require 'functional'
lul.typeinfo = require 'typeinfo'
lul.logger = require 'logger'
lul.version = require 'version'

lul.set = require 'set'
lul.queue = require 'queue'
lul.stack = require 'stack'
lul.optional = require 'optional'

lul.connection = require 'connection'
lul.signal = require 'signal'

lul.taskexecutor = require 'taskexecutor'
lul.observable = require 'observable'
lul.transaction = require 'transaction'

lul.timespan = require 'timespan'
lul.cli = require 'cli'

function lulversion() return lul.version.new(1, 0, 0) end


return lul
