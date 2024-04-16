extends CharacterBody2D
class_name ball

var speed = 0
var acceleration = 15
var direction = Vector2.ZERO
var is_moving = false
var timer

func _ready():
	timer = get_parent().find_child("restartTimer")
	randomize()
	reset_ball()
	
func reset_ball():	
	timer.stop()
	speed = 300
	direction.x = [-1,1][randi() % 2]
	direction.y = [-0.8,0.8][randi() % 2]
	is_moving = true
	
func _physics_process(delta):
	if is_moving:
		speed += acceleration * delta
		velocity.y = speed * direction.y
		velocity.x = speed * direction.x
		
		var collide = move_and_collide(velocity*delta)
		if collide:
			direction = direction.bounce(collide.get_normal())
			$audioCollsion.play()


func _on_restart_timer_timeout():
	reset_ball()
