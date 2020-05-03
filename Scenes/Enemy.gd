extends KinematicBody2D

onready var ray = get_node("RayCast2D")
onready var timer = get_node("SelfTimer")
onready var shotsound = get_node("AudioStreamPlayer2D")

signal shoot
signal game_end
# Called when the node enters the scene tree for the first time.
var dead = false
func _ready():
	pass # Replace with function body.
	
func death():
	dead = true
	rotate(deg2rad(90))
	position.x += 20
	position.y += 40
	emit_signal("game_end")

func _on_Timer_timeout():
	timer.set_wait_time(.8)
	timer.start()


func _on_SelfTimer_timeout():
	if ray.is_colliding() and dead != true:
		get_node("Sprite").animation = "attack"
		emit_signal("shoot")
		shotsound.play()
		
		
