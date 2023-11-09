extends RigidBody3D

var timer:int = 0
const  BATTERY_CHANGE_INTERVAL:int = 5
const BATTERY_LOW_VALUE:int = 20
var is_battery_low:bool = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# UpdateBatteryLevel()
	pass

func UpdateBatteryLevel() : 
	var battery_level:int = self.get_meta("battery")
	if timer >= BATTERY_CHANGE_INTERVAL : 
		battery_level -= 1
		self.set_meta("battery", battery_level)
		timer = 0
		print("battery level changed: ", battery_level)
	else :
		timer += 1
		print("timer value ", timer)


func GoToBase() : 
		print("Go to base position (", self.get_meta("baseXpos"), ", ", self.get_meta("baseYpos"), ", ", self.get_meta("baseZpos"), ")")
		self.position.x = self.get_meta("baseXpos")
		self.position.y = self.position.y 
		self.position.z = self.get_meta("baseZpos")
		
func recharge() : 
	self.set_meta("battery", 100)
func _on_body_entered(tree):
	pass 
