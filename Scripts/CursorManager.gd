extends Node

var default = preload("res://Images/UI/Curseurs/Cursor1.png")
var stop = preload("res://Images/UI/Curseurs/Cursor2.png")
var point = preload("res://Images/UI/Curseurs/Cursor3.png")
var grab = preload("res://Images/UI/Curseurs/Cursor4.png")
var drag = preload("res://Images/UI/Curseurs/Cursor5.png")
var wait = preload("res://Images/UI/Curseurs/Cursor6.png")

func _ready():
	Input.set_custom_mouse_cursor(default, Input.CURSOR_ARROW)
	Input.set_custom_mouse_cursor(stop, Input.CURSOR_FORBIDDEN)
	Input.set_custom_mouse_cursor(point, Input.CURSOR_POINTING_HAND)
	Input.set_custom_mouse_cursor(grab, Input.CURSOR_MOVE)
	Input.set_custom_mouse_cursor(drag, Input.CURSOR_DRAG)
	Input.set_custom_mouse_cursor(wait, Input.CURSOR_WAIT)
