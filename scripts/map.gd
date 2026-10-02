extends StaticBody3D

@export var character: CharacterBody3D
@onready var the_map = $buildings_base_single
func _ready() -> void:
	if the_map.has_method("set_position_node"):
		the_map.set_position_node(character)
		print("set")
