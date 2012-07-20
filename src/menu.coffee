love = require 'lovejs'
gamestate = require './gamestate'
menu = gamestate.new()

buttons = {}

menu.init = ->
  for name in ['start', 'help', 'credits']
    buttons[name] = love.assets.newImage("buttons/#{name}.png")

  love.assets.add(image for name, image of buttons)

menu.enter = ->
  console.log('entering menu')

module.exports = menu
