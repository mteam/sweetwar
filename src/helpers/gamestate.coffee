love = require 'lovejs'
gamestate = exports

current = null

gamestate.new = -> {}

gamestate.switch = (to, args...) ->
  love.timer.nextTick ->
    current?.leave?()
    prev = current
    gamestate.init(to)
    current = to
    current.enter(args...)

gamestate.init = (state) ->
  unless state.__used
    state.init?()
    state.__used = true

callbacks = [
  'update', 'draw', 'keypressed', 'keyreleased',
  'mousepressed', 'mousereleased'
]

for name in callbacks
  do (name) ->
    gamestate[name] = ->
      current[name]?(arguments...)

gamestate.register = ->
  for name in callbacks
    love[name] ?= gamestate[name]
