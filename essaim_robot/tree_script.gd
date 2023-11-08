#
# Tree script 
# 

extends RigidBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ColorChange()

func ColorChange() : 
	var withered:int = get_meta("withered")
	var need_fertilizer:int = get_meta("need_fertilizer")
	
	if withered and  need_fertilizer : 
		var mat:StandardMaterial3D = get_material()
		mat.albedo_color = Color(1,0,0) # red 
	elif withered :
		# need water 
		var mat:StandardMaterial3D = get_material()
		mat.albedo_color = Color(1,1,153 / 255)
	elif need_fertilizer :
		var mat:StandardMaterial3D = get_material()
		mat.albedo_color = Color(139 / 255,69 / 255 ,19 / 255)  # 139,69,19
		
func get_material() :
	var mat:StandardMaterial3D = StandardMaterial3D.new()
	var mesh_instance:MeshInstance3D = get_node("MeshInstance3D2")
	var mesh_instance_:MeshInstance3D = get_node("MeshInstance3D3")
	mesh_instance.material_override = mat
	mesh_instance_.material_override = mat
	
	return mat


func _on_body_entered(drone):
	var needs_water:int = get_meta("withered")
	var need_fertilizer:int = get_meta("need_fertilizer")
	var infected:int = get_meta("infected")
	
	var water_level:float = drone.get_meta("water")
	var fertilizer_level:float = drone.get_meta("fertilizer")
	var pesticide_level:float = drone.get_meta("pesticide")
	
	print("nneds_water: ", needs_water)
	print("need_fertilizer: ", need_fertilizer)
	print("infected: ", infected)
	
	if needs_water == 1 and water_level > 5: 
		drone.set_meta("water", water_level - 5.0)
		set_meta("withered", 0)
		
	if need_fertilizer == 1 and fertilizer_level > 10.0: 
		drone.set_meta("fertilizer", fertilizer_level - 10.0)
		set_meta("need_fertilizer", 0)
		
	if infected == 1 and pesticide_level > 7.0: 
		drone.set_meta("pesticide", pesticide_level - 7.0)
		set_meta("infected", 0)
