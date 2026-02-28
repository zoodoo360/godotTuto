class_name Grenade extends RigidBody2D


const grenade_scene : PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var direction: Vector2 = Vector2.ZERO
@export var speed:float = 1.0


static func createInstance(spawnTransform:Transform2D, spawnDirection:Vector2) ->Grenade:
	var grenade: Grenade = grenade_scene.instantiate() as Grenade
	grenade.direction = spawnDirection
	grenade.transform = spawnTransform
	grenade.linear_velocity = grenade.direction * grenade.speed
	return grenade
	
func explode():
	$AnimationPlayer.play("Explosion")

	
