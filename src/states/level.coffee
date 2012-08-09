love = require 'lovejs'
Enemy = require '../entities/enemy'
TimerQueue = require '../helpers/timer_queue'
gamestate = require '../helpers/gamestate'
list = require '../helpers/linked_list'
level = gamestate.new()

level.init = ->
  level.background = love.assets.addImage('background.png')

level.reset = ->
  level.score = 0
  level.lives = 3
  level.enemies = list.new()
  level.towers = list.new()

  level.queue = new TimerQueue(2)
  level.queue.on('pop', (fn) -> fn())

level.enter = ->
  console.log('entering level')

  level.reset()
  level.run(1)

level.run = (num) ->
  props = level.properties[num - 1]

  for i in [1..props.count]
    level.queue.push ->
      enemy = new Enemy(health: props.health, image: props.image, reward: props.reward)
      enemy.follow(level.path)
      level.enemies.add(enemy)

  return

update = (obj, args...) ->
  obj.update(args...)
  return

level.update = (dt) ->
  level.queue.update(dt)
  level.enemies.each(update, dt)
  level.towers.each(update, dt, level.enemies)
  return

draw = (obj) ->
  obj.draw()

level.draw = ->
  level.enemies.each(draw)
  level.towers.each(draw)
  return

Enemy.on 'dead', (enemy) ->
  level.score += enemy.reward

Enemy.on 'pathEnd', (enemy) ->
  level.lives--
  level.enemies.remove(enemy)

  if level.lives is 0
    alert('level over!')

level.properties = [
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

level.path = [
  [0, 10]
  [100, 10]
  [100, 100]
  [200, 100]
  [200, 400]
]



module.exports = level
