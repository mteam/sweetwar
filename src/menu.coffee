love = require 'lovejs'
gui = require './gui'
gamestate = require './gamestate'
menu = gamestate.new()
game = require './game'

buttons = {}

# menu.init = ->
#   assets = []
#   for name in ['start', 'help', 'credits']
#     assets.push(asset = love.assets.newImage("buttons/#{name}.png"))
#     buttons[name] = love.graphics.newImage(asset) 
  
#   love.assets.add(assets)

menu.enter = ->
  console.log('entering menu')

  start = gui.newButton('start', 10, 10)
  start.on('click', -> gamestate.switch(game))
  gui.add(start)

# menu.draw = ->
#   love.graphics.draw(buttons.start, 10, 10)

menu.leave = ->
  console.log('leaving menu')

  gui.clear()

module.exports = menu
