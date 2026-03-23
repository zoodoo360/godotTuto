class_name Item extends Area2D

const item_scene : PackedScene = preload("res://scenes/items/item.tscn")
var direction:Vector2 = Vector2.ZERO
var distance:int = randi_range(150, 250)
@export var rotationSpeed: float = 200

var available_options = ['laser', 'laser','laser','grenade', 'health']
var type = available_options[randi() % len(available_options)]


static func createInstance(spawnPosition:Vector2, spawnDirection:Vector2) ->Item:
	var item: Item = item_scene.instantiate() as Item
	item.position = spawnPosition
	item.direction = spawnDirection
	return item

func _ready() -> void:
	if type == 'laser':
		$Sprite2D.modulate = Color(0.1, 0.2, 0.8)
	elif type == 'grenade':
		$Sprite2D.modulate = Color(0.8, 0.2, 0.1)
	elif type == 'health':
		$Sprite2D.modulate = Color(0.1, 0.8, 0.2)
	
	var targetposition = position + direction * distance
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "position", targetposition, 0.5)
	tween.tween_property(self, "scale", Vector2(1, 1), 0.5).from(Vector2(0, 0))
	
	
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
