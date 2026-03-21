extends CanvasLayer

var green: Color = Color("6bbfa3")
var red: Color = Color(0.9, 0, 0, 1)

@onready var laserLabel: Label = $AmmoCounter/LaserContainer/Label
@onready var grenadeLabel: Label = $AmmoCounter/GrenageContainer/Label
@onready var laserIcon: TextureRect = $AmmoCounter/LaserContainer/TextureRect
@onready var grenadeIcon: TextureRect = $AmmoCounter/GrenageContainer/TextureRect
@onready var healthBar: TextureProgressBar = $MarginContainer/PlayerHealth


func _ready():
	Globals.connect("stats_changed", updateStats)
	updateStats()

func updateLaserCount() -> void:
	laserLabel.text = str(Globals.laser_amount)
	updateColor(Globals.laser_amount, laserLabel, laserIcon)
	
func updateGrenadeCount() -> void:
	grenadeLabel.text = str(Globals.grenade_amount)
	updateColor(Globals.grenade_amount, grenadeLabel, grenadeIcon)

func updateHealth() -> void:
	healthBar.value = Globals.health
	
func updateStats() -> void:
	updateLaserCount()
	updateGrenadeCount()
	updateHealth()

func updateColor(amount:int, label:Label, icon:TextureRect) -> void:
	if amount <= 0:
		label.modulate = red
		icon.modulate = red
	else:
		label.modulate = green
		icon.modulate = green
