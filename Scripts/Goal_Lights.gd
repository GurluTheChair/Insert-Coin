extends Node2D

onready var light_1 = $Light2D
onready var light_2 = $Light2D2
onready var light_3 = $Light2D3
onready var light_4 = $Light2D4
onready var light_5 = $Light2D5
onready var light_6 = $Light2D6

func _on_Timer_timeout():
	light_1.enabled = !light_1.enabled
	light_2.enabled = !light_2.enabled
	light_3.enabled = !light_3.enabled
	light_4.enabled = !light_4.enabled
	light_5.enabled = !light_5.enabled
	light_6.enabled = !light_6.enabled
