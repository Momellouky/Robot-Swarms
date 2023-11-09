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
#	print("Drones x position: ", self.position.x)
#	print("Drones y position: ", self.position.y)
#	print("Drones z position: ", self.position.z)
	pass

func UpdateBatteryLevel() : 
	var battery_level:int = self.get_meta("battery")
#	print("battery level value: ", battery_level)
	if timer >= BATTERY_CHANGE_INTERVAL : 
		battery_level -= 1
		self.set_meta("battery", battery_level)
		timer = 0
		print("battery level changed: ", battery_level)
#		if battery_level <= BATTERY_LOW_VALUE : 
#			is_battery_low = true 
#			self.set_meta("is_battery_low", is_battery_low)
#			print("Battery is low")
#			# Il faut revenir à la base
#			GoToBase()
#			recharge()
#			self.translate(Vector3(self.get_meta("baseXpos"), 
#							self.get_meta("baseYpos"), 
#							1))
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
#	var needs_water:int = tree.get_meta("withered")
#	var need_fertilizer:int = tree.get_meta("need_fertilizer")
#	var infected:int = tree.get_meta("infected")
#
#	var water_level:float = get_meta("water")
#	var fertilizer_level:float = get_meta("fertilizer")
#	var pesticide_level:float = get_meta("pesticide")
#
#	print("nneds_water: ", needs_water)
#	print("need_fertilizer: ", need_fertilizer)
#	print("infected: ", infected)
#
#	if needs_water == 1 : 
#		set_meta("water", water_level - 5.0)
#		tree.set_meta("withered", 0)
	pass 
