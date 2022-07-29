extends Node2D

onready var effect = $Effect
onready var sprite = $Sprite
onready var nope = $Nope
onready var sound = $Sound
onready var pick = $Pick/pick
onready var put = $Pick/put
onready var cant = $Pick/cant
onready var indicate = $Indicate

const power = 350

var clicked = false
var posable = true

func _on_Area2D_body_entered(body):
	if "Coin" in body.name: 
		body.velocity.y = power
		effect.emitting = true
		sound.play()

func _on_Boing_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and posable:
		clicked = !clicked
		indicate.visible = false
		if clicked:
			pick.play()
		else:
			put.play()
			Input.set_default_cursor_shape(Input.CURSOR_MOVE)
	elif event is InputEventMouseButton and event.pressed and !posable:
		cant.play()

func _process(_delta):
	if clicked:
		position = get_global_mouse_position()
		
func _physics_process(_delta):
	if nope.get_overlapping_areas().size() > 1:
		posable = false
	else:
		posable = true
		
	if posable:
		sprite.self_modulate = Color.white
		if clicked:
			Input.set_default_cursor_shape(Input.CURSOR_DRAG)
	else:
		sprite.self_modulate = Color("eef15959")
		Input.set_default_cursor_shape(Input.CURSOR_FORBIDDEN)


func _on_Bloc_Boing_mouse_entered():
	if !clicked:
		Input.set_default_cursor_shape(Input.CURSOR_MOVE)


func _on_Bloc_Boing_mouse_exited():
	if !clicked:
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
