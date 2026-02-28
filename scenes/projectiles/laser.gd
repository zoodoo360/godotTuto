class_name Laser extends Area2D

const laser_scene : PackedScene = preload("res://scenes/projectiles/laser.tscn")
var direction: Vector2 = Vector2.RIGHT
@export var speed:float = 1.0

func _ready():
	$TTL.start()

func _physics_process(delta):
	movelaser(delta)

static func createInstance(spawnPosition:Vector2, spawnDirection:Vector2, spawnTransform:Transform2D) ->Laser:
	var laser: Laser = laser_scene.instantiate() as Laser
	laser.position = spawnPosition
	laser.direction = spawnDirection
	laser.transform = spawnTransform
	laser.top_level = true
	return laser
	
func movelaser(delta):
	position += speed * direction * delta

func _on_body_entered(body):
	if "gotHit" in body:
		body.gotHit()
	queue_free()


func _on_ttl_timeout():
	print("I'm fading")
	queue_free()
