extends TextureRect  
class_name TextureRectAnimated  

@export var spriteHeight: float 
@export var spriteWidth: float 
@export var loop: bool = false     
@export var animating: bool = true

@export var fps = 30
@onready var fps_inv = 1.0/fps

@onready var totalSprites: int = texture.get_width() / spriteWidth

var currentSprite: int = 0    
var frameDelta = 0

func _ready():
	visible = true

func _process(delta: float):      
	#Stop here if the animation is not supposed to be running.
	if not animating:
		return  
	
	frameDelta += delta
	if frameDelta >= fps_inv:
		frameDelta = 0
		#Set the new region of the sprite sheet to show
		texture.region = Rect2(spriteWidth * currentSprite, 0, spriteWidth, spriteHeight)  

		#Advance the counter
		currentSprite += 1
		  
		#Return to 0 if it already reached the end of the sheet
		if currentSprite > totalSprites:  
			currentSprite = 0        
			
			#If not looping, stop here.
			if not loop:  
				animating = false

func start_animation():  
	currentSprite = 0
	animating = true
