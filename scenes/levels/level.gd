extends Node2D

func _ready():
	pass
	
func _process(_delta):
	pass

func _on_gate_player_entered_gate():
	print("I'm in")

func _on_gate_player_exited_gate():
	print("Not today")

func _on_house_player_entered():
	create_tween().tween_property($Player/PlayerCam, "zoom", Vector2(1, 1), 1)


func _on_house_player_exited():
	create_tween().tween_property($Player/PlayerCam, "zoom", Vector2(0.5, 0.5), 1)
