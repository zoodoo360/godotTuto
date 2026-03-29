extends CharacterBody2D

signal projectile_shot(gunTransform:Transform2D, gunDirection:Vector2)

var inBound:bool = false
var ArmPicked:int = 0


func _physics_process(_delta: float) -> void:
	if inBound:
		look_at(Globals.playerPosition)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		inBound = true
		$LaserCooldown.start()


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		inBound = false
		$LaserCooldown.stop()

func fireLaser() ->void:
	ArmPicked = (ArmPicked +1) % 2
	var armTransform:Transform2D
	var armDirection:Vector2
	
	if ArmPicked:
		armTransform = %RightGunTip.global_transform
		armDirection = (%RightGunTip.global_position - %RightGunRear.global_position).normalized()
	else :
		armTransform = %LeftGunTip.global_transform
		armDirection = (%LeftGunTip.global_position - %LeftGunRear.global_position).normalized()
	projectile_shot.emit(armTransform, armDirection)
	
	


func _on_laser_cooldown_timeout() -> void:
	fireLaser()
