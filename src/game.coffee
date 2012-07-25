love = require 'lovejs'
Enemy = require './enemy'
gamestate = require './gamestate'
game = gamestate.new()

game.init = ->
  game.background = love.assets.addImage('background.png')

game.reset = ->
  game.score = 0
  game.enemies = []
  game.towers = []
  game.queue = []

game.enter = ->
  console.log('entering game')

game.update = (dt) ->
  enemy.update(dt) for enemy in game.enemies
  tower.update(dt, game.enemies) for tower in game.towers

game.draw = ->
  enemy.draw() for enemy in game.enemies
  tower.draw() for tower in game.towers



runLevel = (num) ->
  level = levels[num]

  deadHandler = ->
    game.score += level.reward

  for i in [1..level.count]
    game.queue.push ->
      enemy = new Enemy(health: level.health, image: level.image)
      enemy.on('dead', deadHandler)
      enemy.follow(path)
      enemies.push(enemy)



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
