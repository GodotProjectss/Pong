extends CharacterBody2D

var speed = 600
var ball 

func _ready():
	ball = get_parent().find_child("bola")
	
func _physics_process(delta):
	var direction = Vector2(0,_get_direction())
	velocity.y = speed * direction.y
	move_and_slide()

func _get_direction():
	if abs(ball.position.y - position.y) > 25:
		if ball.position.y > position.y:
			return 1
		else:
			return -1 
	else:
		return 0
