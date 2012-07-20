love = require 'lovejs'
gamestate = require './gamestate'
menu = require './menu'
loader = gamestate.new()

textPos = x: 0, y: 0

loader.enter = ->
  console.info('entering loader')
  love.graphics.push()

  love.graphics.setFont('Arial', 20)
  love.graphics.setTextAlign('center')
  love.graphics.setTextBaseline('middle')

  canvas = love.graphics.getCanvas()
  textPos.x = canvas.width / 2
  textPos.y = canvas.height / 2

  love.assets.load ->
    setTimeout ->
      gamestate.switch(menu)
    , 300

loader.draw = ->
  progress = love.assets.getProgress()
  love.graphics.print("Loading... (#{progress.loaded}/#{progress.total})", textPos.x, textPos.y)

loader.leave = ->
  console.info('leaving loader')
  love.graphics.pop()

module.exports = loader
