love = require 'lovejs'
Vector = require './vectors'

class Enemy
  constructor: ->
    @speed = 1
    @pos = new Vector
    @step = new Vector

  follow: (path) ->
    @path = path.slice()
    @pos.update(@path.shift())

  update: (dt) ->
    if @path.length > 0
      next = @path[0]

      @step.update(next).subtract(@pos)

      if @step.length() < 1
        @pos.update(next)
        @path.shift()
      else
        @step.normalize().multiply(@speed * dt)
        @pos.add(@step)

  render: ->
    love.graphics.circle('fill', @pos.x | 0, @pos.y | 0, 10)

module.exports = Enemy
