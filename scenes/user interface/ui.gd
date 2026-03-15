extends CanvasLayer

@onready var laserlabel: Label = $AmmoCounter/LaserContainer/Label
@onready var grenadeLabel: Label = $AmmoCounter/GrenageContainer/Label

func _ready():
	updateLaserCount()
	updateGrenadeCount()

func updateLaserCount() -> void:
	laserlabel.text = str(Globals.laser_amount)
	
func updateGrenadeCount() -> void:
	grenadeLabel.text = str(Globals.grenade_amount)
