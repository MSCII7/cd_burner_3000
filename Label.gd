extends Label

@onready var highscore_manager = get_node('/root/Highscore')

func _ready():
	text = 'highscore: ' + str(highscore_manager.highscore)
