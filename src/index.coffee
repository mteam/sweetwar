love = require 'lovejs'
gamestate = require './gamestate'
menu = require './menu'
game = require './game'

stats = love.utils.stats()

love.load = ->
	document.body.appendChild(stats.domElement)

	canvas = document.getElementById('game')
	love.graphics.setCanvas(canvas)

	gamestate.register()
	gamestate.switch(menu)

love.update = (dt) ->
	stats.begin()
	gamestate.update(dt)

love.draw = ->
	gamestate.draw()
	stats.end()

exports.run = ->
	love.run()
