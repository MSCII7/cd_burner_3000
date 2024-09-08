extends Node2D

var cd_entrando
var cd_saindo
var cd_files
var lastindex = -1

var score_max = 250.0
var score_obj
var score

@export var min_rpm = 30.0
@export var max_speed_rpm = 100.0
var speed_rpm

@export var side_pos : Node2D
@export var center_pos : Node2D
@export var up_pos : Node2D

func criar_cd():
	var indexcriar = randi() % len(cd_files)
	while indexcriar == lastindex:
		indexcriar = randi() % len(cd_files)
		
	var cd_criado = cd_files[indexcriar]
	cd_entrando = cd_criado.instantiate()
	add_child(cd_entrando)
	cd_entrando.position = side_pos.position
	cd_entrando.centerpos = center_pos
	cd_entrando.uppos = up_pos
	cd_entrando.speed_rpm = speed_rpm
	
	lastindex = indexcriar
	
	
func _ready():
	speed_rpm = min_rpm
	cd_files = [preload("res://cd1.tscn"), 
				preload("res://cd2.tscn"), 
				preload("res://cd3.tscn"),
				preload("res://cd4.tscn"),]
				
	score_obj = $Control/score
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	score = int(score_obj.text)
	speed_rpm = lerp(min_rpm, max_speed_rpm, clamp(score, 0, score_max)/score_max)
	
	if cd_entrando == null or cd_entrando.move_away:
		criar_cd()

