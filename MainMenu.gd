extends Node2D

@onready var buttonAbout = $Control/VBoxContainer/MarginContainer/HBoxContainerButtons/ButtonAbout
var aboutOn = false
var aboutText = "O botão de jogar está pra lá <---"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_begin_pressed():
	get_tree().change_scene_to_file("res://main.tscn")


func _on_button_about_pressed():
	aboutOn = not aboutOn
	if aboutOn:
		buttonAbout.text = aboutText
	else:
		buttonAbout.text = "about ;)"


func _on_check_button_toggled(toggled_on):
	if toggled_on:
		$AudioStreamPlayer2D.play()
	else:
		$AudioStreamPlayer2D.stop()
