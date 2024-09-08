extends Sprite2D

# Called when the node enters the scene tree for the first time.
@export var voltas_para_passar = 3
@export var cd : Node2D

var score_txt : RichTextLabel
var particles : CPUParticles2D

var heartmanager
var quantidade_acertos_cd = 0

var timer_saiu : Timer
var tempo_sobra = false

var inside_prompt = false
var ja_clicou = false

var active = false

func _ready():
	position = Vector2(cos(3 * PI/2), sin(3 * PI/2)) * cd.radius
	score_txt = get_parent().get_parent().get_node("Control/score")
	heartmanager = get_parent().get_parent().get_node("hearts")
	timer_saiu = $timer_saiu
	particles = $particles
	
		
func _physics_process(delta):
	
	active = visible
	position = position.rotated(cd.speed_rpm/60 * 2 * PI * delta)
	if heartmanager.vidas <= 0:
		var hs_manager = get_node("/root/Highscore")
		if hs_manager.highscore <= int(score_txt.text):
			hs_manager.highscore = int(score_txt.text)
		get_tree().change_scene_to_file("res://main_menu.tscn")
		
	if active:
		
		if Input.is_action_just_pressed("acao"):
			particles.restart()
			particles.emitting = true
			if inside_prompt or tempo_sobra:
				var score = int(score_txt.text)
				score += 1
				score_txt.text = str(score)
				quantidade_acertos_cd += 1
				
			else:
				
				heartmanager.vidas -= 1
				
			
	if quantidade_acertos_cd >= voltas_para_passar * len(cd.pattern):
		cd.move_away = true


func _on_area_2d_area_entered(area):
	if area.name == "press_prompt":
		inside_prompt = true
		var prompt = area.get_parent()
		prompt.modulate.a *= 1.3
		prompt.scale *= 1.1
		

func _on_area_2d_area_exited(area):
	if area.name == "press_prompt":
		inside_prompt = false
		tempo_sobra = true
		timer_saiu.start()
		var prompt = area.get_parent()
		prompt.modulate.a /= 1.3
		prompt.scale /= 1.1


func _on_timer_saiu_timeout():
	tempo_sobra = false
	pass # Replace with function body.
