extends Sprite2D

@export var pattern : PackedFloat32Array
@export var radius = 100.0

# Called when the node enters the scene tree for the first time.
func _ready():
	var prompt_base = preload("res://press_prompt.tscn")
	
	for element in pattern:
		print(position)
		var angle_converted = 2 * PI * element - PI/2
		var pos = Vector2(cos(angle_converted), sin(angle_converted)) * radius
		var prompt_obj = prompt_base.instantiate()
		prompt_obj.position = pos
		add_child(prompt_obj)
		print(prompt_obj.position)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
