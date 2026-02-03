extends CharacterBody2D

var characterPosition: Vector2
var moveDirection: Vector2
var aimDirection: Vector2
var rotationSpeed: float = 10*PI
var isShooting: bool
var canShootBullet: bool
var canShootGrenade: bool


@export var moveSpeed: float = 500


func _ready():
	moveDirection = Vector2.ZERO
	characterPosition = Vector2.ZERO
	aimDirection = Vector2.ZERO
	isShooting = false
	canShootBullet = true
	canShootGrenade = true
	

func _process(_delta):
	checkInputs()
	
	
func _physics_process(delta):
	moveCharacter()
	characterRotation(delta)


func moveCharacter():
	velocity =  moveSpeed * moveDirection
	move_and_slide()

func characterRotation(delta):
	if aimDirection!= Vector2.ZERO:
		look_at(global_position + aimDirection)
		#var angleTo = transform.x.angle_to(aimDirection)
		#rotate(sign(angleTo) * min (delta * rotationSpeed, abs(angleTo)))
		#var theta = wrapf(atan2(aimDirection.y, aimDirection.x) - rotation, -PI, PI)
		#rotation += clamp(rotationSpeed, 0, abs(theta)) * sign(theta)


func checkInputs():
	moveInputs()
	aimDirectionInputs()
	playerShoot()
	grenadeOut()

func moveInputs():
	var stickDirection = Input.get_vector("LSLeft", "LSRight", "LSUp", "LSDown").normalized()
	var digitalDirection = Input.get_vector("DLeft", "DRight", "DUp", "DDown").normalized()
	if stickDirection != Vector2.ZERO:
		moveDirection = stickDirection
	elif digitalDirection != Vector2.ZERO:
		moveDirection = digitalDirection
	else:
		moveDirection = Vector2.ZERO

func aimDirectionInputs():
	var rsDirection = Vector2(Input.get_axis("RSLeft", "RSRight"), Input.get_axis("RSUp", "RSDown")).normalized()
	if rsDirection != Vector2.ZERO:
		aimDirection = rsDirection
	elif Input.is_action_pressed("mouseShoot") or Input.is_action_pressed("mouseGrenade"):
		aimDirection = (get_global_mouse_position() - position).normalized()
	elif moveDirection != Vector2.ZERO:
		aimDirection = moveDirection
	else:
		aimDirection = Vector2.ZERO

func playerShoot():
	if (Input.is_action_pressed("mouseShoot") or Input.is_action_pressed("controllerShoot")) and canShootBullet:
		var shootingDirection: Vector2 = ($GunTip.global_position - $GunRear.global_position).normalized()
		var laser:Laser = Laser.createInstance($GunTip.global_position, shootingDirection)
		laser.global_transform = $GunTip.global_transform
		add_child(laser)
		canShootBullet = false
		$ShootTimer.start()
func grenadeOut():
	if (Input.is_action_pressed("mouseGrenade") or Input.is_action_pressed("controllerGrenade")) and canShootGrenade:
		canShootGrenade = false
		$GrenadeTimer.start()

func _on_shoot_timer_timeout():
	canShootBullet = true

func _on_grenade_timer_timeout():
	canShootGrenade = true
