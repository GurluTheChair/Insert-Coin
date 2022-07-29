extends Node2D

onready var spawner = $Spawner
onready var lights = $Lights

var Coin = preload("res://Scenes/Coin.tscn")
var coin

func spawn():
	coin = Coin.instance()
	coin.position = spawner.position
	add_child(coin)
	$Spawner/Spawn.play()
	
func kill():
	coin.queue_free()

func _on_Timer_timeout():
	if lights.get_node("Light2D").enabled:
		lights.get_node("Light2D").enabled = false
		lights.get_node("Light2D2").enabled = true
	elif lights.get_node("Light2D2").enabled:
		lights.get_node("Light2D2").enabled = false
		lights.get_node("Light2D3").enabled = true
	elif lights.get_node("Light2D3").enabled:
		lights.get_node("Light2D3").enabled = false
		lights.get_node("Light2D").enabled = true

