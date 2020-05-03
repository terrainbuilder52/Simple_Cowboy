extends Label

onready var timer = $"../../".get_node("Timer")
var game_start = false
# Called when the node enters the scene tree for the first time.
func _ready():
	text = "Press Space to start"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_select") and game_start == false:
			timer.set_wait_time(2)
			timer.start()
			game_start = true
			
	if timer.time_left > 0:
		text = str(round(timer.time_left) + 1)
		

