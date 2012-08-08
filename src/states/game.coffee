love = require 'lovejs'
Enemy = require '../entities/enemy'
TimerQueue = require '../helpers/timer_queue'
gamestate = require '../helpers/gamestate'
list = require '../helpers/linked_list'
game = gamestate.new()

game.init = ->
  game.background = love.assets.addImage('background.png')

game.reset = ->
  game.score = 0
  game.lives = 3
  game.enemies = list.new()
  game.towers = list.new()

  game.queue = new TimerQueue(2)
  game.queue.on('pop', (fn) -> fn())

game.enter = ->
  console.log('entering game')

  game.reset()
  runLevel(1)

update = (obj, args...) ->
  obj.update(args...)
  return

game.update = (dt) ->
  game.queue.update(dt)
  game.enemies.each(update, dt)
  game.towers.each(update, dt, game.enemies)
  return

draw = (obj) ->
  obj.draw()

game.draw = ->
  game.enemies.each(draw)
  game.towers.each(draw)
  return

Enemy.on 'dead', (enemy) ->
  game.score += enemy.reward

Enemy.on 'pathEnd', (enemy) ->
  game.lives--
  game.enemies.remove(enemy)

  if game.lives is 0
    alert('game over!')

runLevel = (num) ->
  level = levels[num - 1]

  for i in [1..level.count]
    game.queue.push ->
      enemy = new Enemy(health: level.health, image: level.image, reward: level.reward)
      enemy.follow(path)
      game.enemies.add(enemy)

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
