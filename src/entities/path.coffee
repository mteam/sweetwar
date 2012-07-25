class Path
  constructor: (path) ->
    if path?
      @path = path.slice()
      @pop()

  pop: ->
    @next = @path.shift()

  empty: ->
    @path.length is 0

module.exports = Path
