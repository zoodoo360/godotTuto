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
	aimDirection = Vector2.RIGHT
	isShooting = false
	canShootBullet = true
	canShootGrenade = true
	

func _process(_delta):
	checkInputs()
	
	
func _physics_process(_delta):
	moveCharacter()

func moveCharacter():
	velocity =  moveSpeed * moveDirection
	move_and_slide()

func characterRotation():
	if aimDirection!= Vector2.ZERO:
		look_at(global_position + aimDirection)
		#var angleTo = transform.x.angle_to(aimDirection)
		#rotate(sign(angleTo) * min (delta * rotationSpeed, abs(angleTo)))
		#var theta = wrapf(atan2(aimDirection.y, aimDirection.x) - rotation, -PI, PI)
		#rotation += clamp(rotationSpeed, 0, abs(theta)) * sign(theta)

func shootLaser() -> void:
	var laser:Laser = Laser.createInstance($GunTip.global_position, aimDirection, $GunTip.global_transform)
	$GPUParticles2D.emitting = true
	$Clip.add_child(laser)
	canShootBullet = false
	$ShootTimer.start()

func shootGrenade() -> void:
	var grenade:Grenade = Grenade.createInstance($GunTip.global_position, aimDirection, $GunTip.global_transform)
	$GrenadePouch.add_child(grenade)
	canShootGrenade = false
	$GrenadeTimer.start()

func checkInputs():
	moveInputs()
	aimDirectionInputs()
	laserInput()
	grenadeInput()

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
	characterRotation()

func laserInput():
	if canShootBullet:
		if (Input.is_action_pressed("mouseShoot") or Input.is_action_pressed("controllerShoot")):
			shootLaser()

func grenadeInput():
	if (Input.is_action_pressed("mouseGrenade") or Input.is_action_pressed("controllerGrenade")) and canShootGrenade:
		shootGrenade()

func _on_shoot_timer_timeout():
	canShootBullet = true

func _on_grenade_timer_timeout():
	canShootGrenade = true
