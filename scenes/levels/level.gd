class_name LevelParent extends Node2D


func _ready():
	for container in get_tree().get_nodes_in_group("Container"):
		container.connect("opened", on_container_opened)
	
func _process(_delta):
	pass

func _on_player_projectile_shot(gunTransform:Transform2D, gunDirection:Vector2):
	var laser:Laser = Laser.createInstance(gunTransform, gunDirection)
	$UI.updateLaserCount()
	$Clip.add_child(laser)


func _on_player_grenade_shot(gunTransform, gunDirection):
	var grenade:Grenade = Grenade.createInstance(gunTransform, gunDirection)
	$UI.updateGrenadeCount()
	$GrenadePouch.add_child(grenade)
	

func on_container_opened(pos:Vector2, dir:Vector2) -> void:
	var item:Item = Item.createInstance(pos, dir)
	$Orbs.call_deferred('add_child', item)
