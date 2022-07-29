extends CanvasLayer

onready var back = $Control/Background
onready var play_b = $Control/Play
onready var exit_b = $Control/Exit

var menu1 = preload("res://Images/UI/Menu1.png")
var menu2 = preload("res://Images/UI/Menu2.png")

var exit = preload("res://Images/UI/Survol/exit.png")
var play = preload("res://Images/UI/Survol/play.png")

var alterne = true

var default = preload("res://Images/UI/Curseurs/Cursor1.png")
var stop = preload("res://Images/UI/Curseurs/Cursor2.png")
var point = preload("res://Images/UI/Curseurs/Cursor3.png")
var grab = preload("res://Images/UI/Curseurs/Cursor4.png")
var drag = preload("res://Images/UI/Curseurs/Cursor5.png")
var wait = preload("res://Images/UI/Curseurs/Cursor6.png")

func _ready():
	Input.set_custom_mouse_cursor(default, Input.CURSOR_ARROW)
	Input.set_custom_mouse_cursor(stop, Input.CURSOR_FORBIDDEN, Vector2(31,31))
	Input.set_custom_mouse_cursor(point, Input.CURSOR_POINTING_HAND)
	Input.set_custom_mouse_cursor(grab, Input.CURSOR_MOVE, Vector2(35,35))
	Input.set_custom_mouse_cursor(drag, Input.CURSOR_DRAG, Vector2(26,24))
	Input.set_custom_mouse_cursor(wait, Input.CURSOR_WAIT, Vector2(24,29))

func _process(_delta):
	if alterne:
		back.set_texture(menu1)
	else:
		back.set_texture(menu2)

func _on_Timer_timeout():
	alterne = !alterne

func _on_Play_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes/Level.tscn")

func _on_Exit_pressed():
	get_tree().quit()
