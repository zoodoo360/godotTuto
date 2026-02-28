extends StaticBody2D

signal player_entered
signal player_exited


func _on_area_2d_body_entered(_body):
	player_entered.emit()


func _on_area_2d_body_exited(_body):
	player_exited.emit()
