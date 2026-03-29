extends Node

signal stats_changed

var laser_amount:int = 20:
	set(value):
		laser_amount = value
		stats_changed.emit()
		
var grenade_amount:int = 5:
	set(value):
		grenade_amount = value
		stats_changed.emit()
		
var health:int = 60:
	set(value):
		health = value
		stats_changed.emit()

var playerPosition:Vector2
		
		
