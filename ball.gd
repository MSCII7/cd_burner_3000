extends Sprite2D

# Called when the node enters the scene tree for the first time.
@export var speed = 100.0
@export var cd : Node2D

func _ready():
	position = Vector2(cos(3 * PI/2), sin(3 * PI/2)) * cd.radius
	pass # Replace with function body.


func _physics_process(delta):
	position = position.rotated(speed * delta)
	pass
	
