extends KinematicBody2D

onready var sprite = $Sprite
onready var tic = $Tic
onready var roll = $Roll

const speed_max = 500
const rotation_speed = 0.05
const accel = 9
const deccel = 0.5
const accel_g = 1

var speed = 0
var gravity = 300
var velocity = Vector2()
var normal_sol:Vector2
var airborne = true

func _physics_process(delta):
	velocity.y += gravity * delta
	if normal_sol.x > -0.1 and normal_sol.x < 0.1:
		normal_sol.x = 0
	if normal_sol.y > -0.1 and normal_sol.y < 0.1:
		normal_sol.y = 0
	var pente_angle = -normal_sol.angle_to(Vector2.UP)
	if pente_angle > 0:
		velocity.x = min(velocity.x+accel,speed_max)
	elif pente_angle < 0:
		velocity.x = max(velocity.x-accel,-speed_max)
	else:
		if velocity.x > 0:
			velocity.x = max(velocity.x-deccel,-speed_max)
		elif velocity.x < 0:
			velocity.x = min(velocity.x+deccel,speed_max)

	var before = velocity
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if is_on_floor() and (velocity.x > 10 or velocity.x < -10):
		if !roll.playing:
			roll.play()
	else:
		roll.stop()
	
	printt(velocity.x, before.x)
	if velocity.y > -1 and velocity.y < 1 and abs(before.y) > 1:
		print(before.y)
		velocity.y -= before.y/2
		if velocity.y > 10 or velocity.y < -10:
			tic.play()
	if velocity.x > -2 and velocity.x < 2 and abs(before.x) > 2:
		velocity.x -= before.x/2
		if velocity.x > 10 or velocity.x < -10:
			tic.play()
	
	var count = 0
	normal_sol = Vector2.ZERO
	var slides = get_slide_count()
	for i in slides:
		var normal_c = get_slide_collision(i).normal
		if normal_c.y < 0:
			normal_sol += normal_c
			count += 1
	if count > 0:
		normal_sol /= count

func _process(delta):
	var l = velocity.length()
	if velocity.x < 0:
		l =  -velocity.length()
	sprite.rotate(l * rotation_speed * delta)
