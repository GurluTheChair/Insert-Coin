extends CanvasLayer

onready var go = $Control/GO
onready var stop = $Control/STOP
onready var home = $Control/HOME
onready var win = $Control/Win
onready var lose = $Control/Lose
onready var current = get_parent().name

var clickable = true
var blocks
var launcher

func _ready():
	blocks = get_parent().get_node("Blocks")
	launcher = get_parent().get_node("Launcher")

func _on_GO_pressed():
	if clickable:
		go.visible = false
		stop.visible = true
		launcher.spawn()
		Input.set_default_cursor_shape(Input.CURSOR_WAIT)
		for n in blocks.get_children():
			n.input_pickable = false


func _on_STOP_pressed():
	if clickable:
		stop.visible = false
		go.visible = true
		launcher.kill()
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
		for n in blocks.get_children():
			n.input_pickable = true


func _on_Next_pressed():
	match current:
		"Level": current = "Level3"
		"Level2": current = "Level"
		"Level3": current = "Level4"
		"Level4": current = "Level2"
	win.visible = false
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/"+current+".tscn")


func _on_Again_pressed():
	win.visible = false
	home.visible = true
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/"+current+".tscn")


func _on_Quit_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Menu.tscn")


func _on_Restart_pressed():
	lose.visible = false
	go.visible = true
	stop.visible = false
	$Control/Lose/Restart/Home.play()


func _on_HOME_pressed():
	if clickable:
# warning-ignore:return_value_discarded
		get_tree().change_scene("res://Scenes/Menu.tscn")

		
func _on_Area2D_area_entered(area):
	if area.get_parent().name.begins_with("Bloc"):
		go.set_default_cursor_shape(Input.CURSOR_FORBIDDEN)
		home.set_default_cursor_shape(Input.CURSOR_FORBIDDEN)
		clickable = false


func _on_Area2D_area_exited(area):
	if area.get_parent().name.begins_with("Bloc"):
		go.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
		home.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
		clickable = true
