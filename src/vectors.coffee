class Vector
  constructor: ->
    @update([0, 0])

  clone: ->
    v = new Vector
    v.x = @x
    v.y = @y
    v

  update: ([@x, @y]) ->
    this

  add: ({x, y}) ->
    @x += x
    @y += y
    this

  subtract: ({x, y}) ->
    @x -= x
    @y -= y
    this

  multiply: (n) ->
    @x *= n
    @y *= n
    this

  divide: (n) ->
    @x /= n
    @y /= n
    this

  length: ->
    Math.sqrt(@x * @x + @y * @y)

  normalize: ->
    @divide(@length())

module.exports = Vector
