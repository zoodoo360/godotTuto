extends LevelParent


func _on_exit_gate_area_body_entered(_body: Node2D) -> void:
	get_tree().call_deferred("change_scene_to_file", "res://scenes/levels/outside.tscn")
