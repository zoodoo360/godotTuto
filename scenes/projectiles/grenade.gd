class_name Grenade extends RigidBody2D


const grenade_scene : PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var direction: Vector2 = Vector2.ZERO
@export var speed:float = 1.0

func _physics_process(_delta):
	#movelaser(delta)
	pass

static func createInstance(spawnPosition:Vector2, spawnDirection:Vector2) ->Grenade:
	var grenade: Grenade = grenade_scene.instantiate() as Grenade
	grenade.position = spawnPosition
	grenade.direction = spawnDirection
	grenade.top_level = true
	return grenade
