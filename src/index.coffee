love = require 'lovejs'
gui = require './helpers/gui'
gamestate = require './helpers/gamestate'
loader = require './states/loader'

stats = love.utils.stats()

love.load = ->
  document.body.appendChild(stats.domElement)

  canvas = document.getElementById('game')
  love.graphics.setCanvas(canvas)
  container = document.getElementById('game-container')
  gui.setContainer(container)

  gamestate.register()

  gamestate.init(require('./states/menu'))
  gamestate.init(require('./states/game'))

  gamestate.switch(loader)

love.update = (dt) ->
  stats.begin()
  gamestate.update(dt)

love.draw = ->
  gamestate.draw()
  stats.end()

exports.run = ->
  love.run()
