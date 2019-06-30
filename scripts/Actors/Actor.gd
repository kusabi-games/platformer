extends KinematicBody2D

var velocity : Vector2 = Vector2()

func _ready():
	pass

func _physics_process(delta):
	velocity = move_and_slide(velocity, Global.Up)