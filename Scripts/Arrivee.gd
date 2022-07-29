extends Node2D

onready var confetti = $Confetti
onready var win = $Win

var ui
var despawn

var happy = preload("res://Images/PieceContente.png")

func _ready():
	ui = get_parent().get_node("UI/Control")
	despawn = get_parent().get_node("Void/Despawn")

func _on_Area2D_body_entered(body):
	if "Coin" in body.name: 
		win.play()
		for n in despawn.get_children():
			n.set_deferred("disabled",true)
		ui.get_node("STOP").visible = false
		ui.get_node("GO").visible = false
		ui.get_node("HOME").visible = false
		body.get_node("Sprite").set_texture(happy)
		confetti.emitting = true
		yield(get_tree().create_timer(3), "timeout")
		ui.get_node("Win").visible = true
		ui.get_node("STOP").emit_signal("pressed")
		

