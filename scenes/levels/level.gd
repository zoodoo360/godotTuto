class_name LevelParent extends Node2D


func _ready():
	pass
	
func _process(_delta):
	pass

func _on_player_projectile_shot(gunTransform:Transform2D, gunDirection:Vector2):
	var laser:Laser = Laser.createInstance(gunTransform, gunDirection)
	$Clip.add_child(laser)


func _on_player_grenade_shot(gunTransform, gunDirection):
	var grenade:Grenade = Grenade.createInstance(gunTransform, gunDirection)
	$GrenadePouch.add_child(grenade)
