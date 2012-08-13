love = require 'lovejs'

###

This queue will frequently pop values.

> q = new Queue(300) # pop after every 300 ms
> q.push(i) for i in [1..3]
> q.on('pop', (i) -> console.log('popped', i))
> q.update(100)
> q.update(200)
popped 1
> q.update(600)
popped 2
> q.update(0)
popped 3

###

class Queue
  constructor: (@interval) ->
    @queue = []
    @timer = 0
    love.eventify(this)

  push: (val) ->
    @queue.push(val)

  update: (dt) ->
    @timer += dt

    if @timer > @interval
      @timer -= @interval
      @trigger('pop', @queue.shift()) if @queue.length > 0

exports.new = (interval) ->
  new Queue(interval)
