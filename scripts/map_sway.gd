extends Node3D
@export var map: MeshInstance3D
@export var amplitude: float = 1.0
@export var frequecy: float = 1.0
@export var wave_speed: float = 1.0
@export var wave_center_node: CharacterBody3D

func set_position_node(character):
	wave_center_node = character

func _process(_delta):
	if wave_center_node:
		var mat = map.get_active_material(0) as ShaderMaterial
		var mat1 = map.get_active_material(1) as ShaderMaterial
		var mat2 = map.get_active_material(2) as ShaderMaterial
		var mat3 = map.get_active_material(3) as ShaderMaterial
		if mat:
			mat.set_shader_parameter("node_world_pos", wave_center_node.global_position)
			mat1.set_shader_parameter("node_world_pos", wave_center_node.global_position)
			mat2.set_shader_parameter("node_world_pos", wave_center_node.global_position)
			mat3.set_shader_parameter("node_world_pos", wave_center_node.global_position)
			
			mat.set_shader_parameter("wave_amplitude", amplitude)
			mat.set_shader_parameter("wave_frequency", frequecy)
			mat.set_shader_parameter("wave_speed", wave_speed)
			
			mat1.set_shader_parameter("wave_amplitude", amplitude)
			mat1.set_shader_parameter("wave_frequency", frequecy)
			mat1.set_shader_parameter("wave_speed", wave_speed)
			
			mat2.set_shader_parameter("wave_amplitude", amplitude)
			mat2.set_shader_parameter("wave_frequency", frequecy)
			mat2.set_shader_parameter("wave_speed", wave_speed)
			
			mat3.set_shader_parameter("wave_amplitude", amplitude)
			mat3.set_shader_parameter("wave_frequency", frequecy)
			mat3.set_shader_parameter("wave_speed", wave_speed)
