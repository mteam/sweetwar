class LinkedList
  constructor: ->
    @first = null
    @last = null

  add: (obj) ->
    node = @createNode(obj)

    if @first is null
      @first = node
      @last = node
      return node

    @last.next = node
    node.prev = @last
    @last = node

    return node

  remove: (obj) ->
    node = @first
    while node

      if node.obj is obj
        if node is @first
          @first = node.next
        else
          node.prev.next = node.next

        if node is @last
          @last = node.prev
        else
          node.next.prev = node.prev

        break

      node = node.next
    return

  each: (fn, args...) ->
    node = @first
    while node
      if fn(node.obj, args...) then break
      node = node.next
    return

  createNode: (obj) ->
    prev: null, obj: obj, next: null

exports.new = ->
  new LinkedList
