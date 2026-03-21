extends Area2D

@export var rotationSpeed: float = 200

var available_options = ['laser', 'laser','laser','grenade', 'health']
var type = available_options[randi() % len(available_options)]
	
func _ready() -> void:
	if type == 'laser':
		$Sprite2D.modulate = Color(0.1, 0.2, 0.8)
	elif type == 'grenade':
		$Sprite2D.modulate = Color(0.8, 0.2, 0.1)
	elif type == 'health':
		$Sprite2D.modulate = Color(0.1, 0.8, 0.2)
	
func _physics_process(delta: float) -> void:
	spiralEffect(delta)
	
func spiralEffect(delta: float) -> void:
	rotation += rotationSpeed * delta

func _on_body_entered(_body: Node2D) -> void:
	if type == 'health':
		Globals.health += 10
	elif type == 'laser':
		Globals.laser_amount += 5
	elif type == 'grenade':
		Globals.grenade_amount += 1
	queue_free()
