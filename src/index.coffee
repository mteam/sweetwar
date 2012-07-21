love = require 'lovejs'
gui = require './gui'
gamestate = require './gamestate'
loader = require './loader'

stats = love.utils.stats()

love.load = ->
  document.body.appendChild(stats.domElement)

  canvas = document.getElementById('game')
  love.graphics.setCanvas(canvas)
  container = document.getElementById('game-container')
  gui.setContainer(container)

  gamestate.register()

  gamestate.init(require('./menu'))
  gamestate.init(require('./game'))

  gamestate.switch(loader)

love.update = (dt) ->
  stats.begin()
  gamestate.update(dt)

love.draw = ->
  gamestate.draw()
  stats.end()

exports.run = ->
  love.run()
