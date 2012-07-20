love = require 'lovejs'
gamestate = require './gamestate'
game = gamestate.new()

game.init = ->
  # love.assets.addImages(level.image for level in levels)

levels = [
  {
    count: 5
    health: 10
    reward: 1
    image: 'enemy.png'
  }
  {
    count: 10
    health: 10
    reward: 2
    image: 'enemy.png'
  }
  {
    count: 10
    health: 20
    reward: 4
    image: 'enemy.png'
  }
]

path = [
  [0, 10]
  [100, 10]
  [100, 100]
  [200, 100]
  [200, 400]
]

module.exports = game
