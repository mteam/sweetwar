love = require 'lovejs'
Enemy = require '../entities/enemy'
TimerQueue = require '../helpers/timer_queue'
gamestate = require '../helpers/gamestate'
game = gamestate.new()

game.init = ->
  game.background = love.assets.addImage('background.png')

game.reset = ->
  game.score = 0
  game.enemies = []
  game.towers = []

  game.queue = new TimerQueue(2)
  game.queue.on('pop', (fn) -> fn())

game.enter = ->
  console.log('entering game')

  game.reset()
  runLevel(1)

game.update = (dt) ->
  game.queue.update(dt)
  enemy.update(dt) for enemy in game.enemies
  tower.update(dt, game.enemies) for tower in game.towers
  return

game.draw = ->
  enemy.draw() for enemy in game.enemies
  tower.draw() for tower in game.towers
  return

Enemy.on 'dead', (enemy) ->
  game.score += enemy.reward

runLevel = (num) ->
  level = levels[num - 1]

  for i in [1..level.count]
    game.queue.push ->
      enemy = new Enemy(health: level.health, image: level.image, reward: level.reward)
      enemy.follow(path)
      game.enemies.push(enemy)

  return



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
