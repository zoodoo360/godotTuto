extends LevelParent

func _on_gate_player_entered():
	get_tree().call_deferred("change_scene_to_file", "res://scenes/levels/inside.tscn")

func _on_gate_player_exited():
	print("Forgot something")


func _on_house_player_entered():
	create_tween().tween_property($Player/PlayerCam, "zoom", Vector2(1, 1), 1)


func _on_house_player_exited():
	create_tween().tween_property($Player/PlayerCam, "zoom", Vector2(0.5, 0.5), 1)
