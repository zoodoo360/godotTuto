extends Node2D

func _ready():
	pass
	
func _process(_delta):
	pass


func _on_gate_player_entered_gate():
	print("I'm in")


func _on_gate_player_exited_gate():
	print("Not today")
