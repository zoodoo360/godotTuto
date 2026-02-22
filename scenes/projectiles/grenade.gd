class_name Grenade extends RigidBody2D


const grenade_scene : PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var direction: Vector2 = Vector2.ZERO
@export var speed:float = 1.0


static func createInstance(spawnPosition:Vector2, spawnDirection:Vector2, spawnTransform:Transform2D) ->Grenade:
	var grenade: Grenade = grenade_scene.instantiate() as Grenade
	grenade.position = spawnPosition
	grenade.direction = spawnDirection
	grenade.transform = spawnTransform
	grenade.linear_velocity = grenade.direction * grenade.speed
	grenade.top_level = true
	return grenade
	
func explode():
	$AnimationPlayer.play("Explosion")

	
