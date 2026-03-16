extends LevelParent


func _on_exit_gate_area_body_entered(_body: Node2D) -> void:
	TransitionLayer.changeScene("res://scenes/levels/outside.tscn")
