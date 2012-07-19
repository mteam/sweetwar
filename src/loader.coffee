love = require 'lovejs'
gamestate = require './gamestate'
menu = require './menu'
loader = gamestate.new()

loader.enter = ->
  love.assets.load ->
    gamestate.switch(menu)

loader.draw = ->
  progress = love.assets.getProgress()
  love.graphics.print("loading...", 100, 100)
  love.graphics.print("#{progress.loaded}/#{progress.all}", 100, 150)

module.exports = loader
