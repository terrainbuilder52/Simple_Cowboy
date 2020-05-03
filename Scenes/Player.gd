extends KinematicBody2D

onready var ray = get_node("RayCast2D")
onready var shotsound = get_node("AudioStreamPlayer2D")
signal game_end


var dead = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	if dead == true:
		get_node("Label").text = ""


func _on_FireButton_pressed():
	var sprite = get_node("Sprite")
	sprite.animation = "attack"	
	if ray.is_colliding():
		var enemy = ray.get_collider()
		enemy.death()
		shotsound.play()
		


func _on_Enemy_shoot():
	dead = true
	rotate(deg2rad(-90))
	position.x -= 20
	position.y += 40
	emit_signal("game_end")
