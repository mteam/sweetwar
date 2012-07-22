love = require 'lovejs'
gui = require './gui'
gamestate = require './gamestate'
menu = gamestate.new()
game = require './game'

buttons =
  Start: -> gamestate.switch(game)
  Help: -> gamestate.switch(help)

buttonWidth = 100
buttonHeight = 40
buttonsSpacing = 20

menu.enter = ->
  console.log('entering menu')

  screen = width: love.graphics.getWidth(), height: love.graphics.getHeight()

  num = Object.keys(buttons).length
  height = (num * buttonHeight) + ((num - 1) * buttonsSpacing)
  left = (screen.width - buttonWidth) / 2
  top = (screen.height - height) / 2

  for label, fn of buttons
    button = gui.newButton(label, left, top)
    button.setStyle(width: buttonWidth, height: buttonHeight)
    button.on('click', fn)

    gui.add(button)
    
    top += buttonHeight + buttonsSpacing

menu.leave = ->
  console.log('leaving menu')

  gui.clear()

module.exports = menu
