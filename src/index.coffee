love = require 'lovejs'
Enemy = require './enemy'

enemy = null
stats = love.utils.stats()

love.load = ->
  document.body.appendChild(stats.domElement)

  canvas = document.getElementById('game')
  love.graphics.setCanvas(canvas)
  love.graphics.setBackgroundColor(77, 255, 77)

  path = [
    [300, 200]
    [200, 300]
    [400, 100]
    [100, 200]
  ]

  exports.enemy = enemy = new Enemy
  enemy.speed = 70
  enemy.follow(path)

love.update = (dt) ->
  stats.begin()
  enemy.update(dt)

love.draw = ->
  enemy.render()
  stats.end()

exports.run = ->
  love.run()
