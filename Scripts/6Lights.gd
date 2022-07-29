extends Node2D

onready var light_1 = $Light2D
onready var light_2 = $Light2D2
onready var light_3 = $Light2D3
onready var light_4 = $Light2D4
onready var light_5 = $Light2D5
onready var light_6 = $Light2D6

func _on_Timer_timeout():
	if light_1.enabled:
		light_1.enabled = false
		light_4.enabled = false
		light_2.enabled = true
		light_5.enabled = true
	elif light_2.enabled: 
		light_2.enabled = false
		light_5.enabled = false
		light_3.enabled = true
		light_6.enabled = true
	elif light_3.enabled:
		light_3.enabled = false
		light_6.enabled = false
		light_1.enabled = true
		light_4.enabled = true
