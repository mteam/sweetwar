love = require 'lovejs'
gamestate = require './gamestate'
menu = require './menu'
loader = gamestate.new()

loader.enter = ->
  love.assets.load ->
    setTimeout ->
      gamestate.switch(menu)
    , 300

loader.draw = ->
  progress = love.assets.getProgress()
  love.graphics.print("loading... (#{progress.loaded}/#{progress.total})", 100, 100)

module.exports = loader
