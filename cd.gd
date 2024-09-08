extends Sprite2D

@export var pattern : PackedFloat32Array
@export var radius = 100.0
@export var move_speed = 100
var speed_rpm = 0

var centerpos : Node2D
var uppos : Node2D

var active = false
var move_in = true
var move_away = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var prompt_base = preload("res://press_prompt.tscn")
	
	for element in pattern:
		var angle_converted = 2 * PI * element - PI/2
		var pos = Vector2(cos(angle_converted), sin(angle_converted)) * radius
		var prompt_obj = prompt_base.instantiate()
		
		prompt_obj.position = pos
		add_child(prompt_obj)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if move_away or move_in:
		active = false
	else:
		active = true
		
	if not active:
		for child in get_children():
			child.visible = false
	else:
		for child in get_children():
			child.visible = true
			
	if move_in and centerpos != null and position.x > centerpos.position.x:
		position.x += -move_speed * delta
		
	elif move_in and position.x < centerpos.position.x:
		position.x = centerpos.position.x
		move_in = false
		
	if move_away:
		position.y += -move_speed * delta
	if position.y < uppos.position.y:
		queue_free()
