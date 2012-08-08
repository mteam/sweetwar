love = require 'lovejs'
Vector = require '../helpers/vectors'
Path = require './path'

class Enemy
  love.eventify(this)

  @speed: 40

  constructor: ({@health, @image, @reward})->
    @pos = new Vector
    @step = new Vector
    @path = new Path
    @following = false

  trigger: (event, args...) ->
    @constructor.trigger(event, this, args...)

  follow: (path) ->
    @path.constructor(path)
    @pos.update(@path.next)
    @path.pop()
    @following = true

  update: (dt) ->
    if next = @path.next
      @step.update(next).subtract(@pos)

      if @step.length() < 1
        @pos.update(next)
        @path.pop()
      else
        @step.normalize().multiply(Enemy.speed * dt)
        @pos.add(@step)
    else if @following
      @following = false
      @trigger('pathEnd')

  draw: ->
    love.graphics.circle('fill', @pos.x | 0, @pos.y | 0, 10)

module.exports = Enemy
