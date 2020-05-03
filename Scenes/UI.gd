extends Control

onready var timer = $"../".get_node("Timer")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Enemy_shoot():
	get_node("Node2D").queue_free()


func _on_Player_game_end():
	get_node("CountDownLabel").text = "Press 'R' to restart"



func _on_Enemy_game_end():
	get_node("CountDownLabel").text = "Press 'R' to restart"


func _on_Timer_timeout():
	get_node("CountDownLabel").text = ""
