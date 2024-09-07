extends Sprite2D


# Called when the node enters the scene tree for the first time.
@export var speed = 100.0
@export var centro : Node2D
@export var raio = 100

func _ready():
	position = centro.position + Vector2(cos(3 * PI/2), sin(3 * PI/2)) * raio
	pass # Replace with function body.


func _physics_process(delta):
	position = centro.position + (position - centro.position).rotated(speed * delta)
	pass
	
