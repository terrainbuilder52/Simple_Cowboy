extends Node

onready var timer = get_node("Timer")

var game_end = false

func _ready():
	randomize()
	
func _process(delta):
	if Input.is_action_just_pressed("restart") and game_end == true:
		get_tree().change_scene("res://Scenes/World.tscn")
func _on_Timer_timeout():
	timer.stop()
	$Control/Node2D/FireButton.visible = true
	$Control/Node2D.position.x = int(rand_range(100, get_viewport().size.x - 100))
	$Control/Node2D.position.y = int(rand_range(100, get_viewport().size.y /2))


func _on_Player_game_end():
	game_end = true


func _on_Enemy_game_end():
	game_end = true
