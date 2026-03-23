class_name ItemContainer extends StaticBody2D

signal opened(position:Vector2, direction:Vector2)
var isOpened:bool = false
var count:int = 5
@onready var currentDirection: Vector2 = Vector2.DOWN.rotated(rotation)

func gotHit() -> void:
	if not isOpened:
		isOpened = true
		$LidSprite.hide()
		for i in range(count):
			var pos:Vector2 = global_position
			if $SpawnPositions.get_child_count():
				pos = $SpawnPositions.get_child(randi() % $SpawnPositions.get_child_count()).global_position
			opened.emit(pos, currentDirection)
