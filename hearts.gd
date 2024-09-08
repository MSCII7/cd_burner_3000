extends Node2D

var vidas = 3
var hearts = []
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		hearts.append(child)
	pass # Replace with function body.

func see_children(amount : int):
	for child in get_children():
		child.visible = true
		if amount == 2:
			if child.name == "h3":
				child.visible = false
		elif amount == 1:
			if child.name == "h3" or child.name == "h2":
				child.visible = false
		elif amount == 0:
			child.visible = false
				
				
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	see_children(vidas)
	pass
