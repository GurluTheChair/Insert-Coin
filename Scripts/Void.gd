extends Node2D

var ui

func _ready():
	ui = get_parent().get_node("UI/Control")

func _on_Despawn_body_entered(body):
	if "Coin" in body.name: 
		ui.get_node("STOP").emit_signal("pressed")
		ui.get_node("STOP").visible = false
		ui.get_node("GO").visible = false
		ui.get_node("Lose").visible = true
		ui.get_node("Lose/Kill").play()
