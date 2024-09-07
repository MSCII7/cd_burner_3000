extends Node2D

var cd_entrando
var cd_saindo
var cd_files
var lastindex = 0

@export var side_pos : Node2D
@export var center_pos : Node2D

# Called when the node enters the scene tree for the first time.
func criar_cd():
	var indexcriar = randi() % len(cd_files)
	while indexcriar == lastindex:
		indexcriar = randi() % len(cd_files)
		
	var cd_criado = cd_files[indexcriar]
	cd_entrando = cd_criado.instantiate()
	add_child(cd_entrando)
	cd_entrando.position = side_pos.position
	cd_entrando.centerpos = center_pos
	
	lastindex = indexcriar
	
func _ready():
	cd_files = [preload("res://cd1.tscn"), preload("res://cd2.tscn"), preload("res://cd3.tscn"),]
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if cd_entrando == null or cd_entrando.move_away:
		criar_cd()
	pass
