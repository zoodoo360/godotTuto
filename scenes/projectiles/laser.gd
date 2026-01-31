class_name Laser extends Area2D

const laser_scene : PackedScene = preload("res://scenes/projectiles/laser.tscn")

var direction: Vector2 = Vector2.ZERO
@export var speed:float = 1.0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

func _physics_process(delta):
	#movelaser(delta)
	pass

static func createInstance(spawnPosition:Vector2, spawnDirection:Vector2, spwanRotation:float) ->Laser:
	var laser: Laser = laser_scene.instantiate() as Laser
	laser.position = spawnPosition
	laser.direction = spawnDirection
	laser.top_level = true
	return laser
	
func movelaser(delta):
	position += speed * direction * delta
