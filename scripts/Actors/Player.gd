extends "res://scripts/Actors/Actor.gd"

export var speed = 400;
export var jump = 700;

func floor_controls():
	if Input.is_action_pressed("jump"):
		velocity.y = -jump
	
	if Input.is_action_pressed("left"):
		velocity.x = -speed
	elif Input.is_action_pressed("right"):
		velocity.x = speed
	else:
		velocity.x *= Global.Friction
		if abs(velocity.x) < 5:
			velocity.x = 0

func air_controls():		
	if Input.is_action_pressed("left"):
		velocity.x = -speed
	elif Input.is_action_pressed("right"):
		velocity.x = speed
	else:
		velocity.x *= Global.AirResistance
		if abs(velocity.x) < 2:
			velocity.x = 0
	
	if is_on_wall():
		velocity += (Global.Gravity / 50)
		if Input.is_action_pressed("jump"):
			velocity = Vector2(-speed, -jump).bounce(get_slide_collision(0).normal)
	else:
		velocity += Global.Gravity
		
	if is_on_floor():
		velocity.y = 0


func _process(delta):
	if is_on_floor():
		floor_controls()
	else:
		air_controls()