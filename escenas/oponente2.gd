extends CharacterBody2D

var speed = 500

func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	
	velocity.y = speed * direction.y

	move_and_slide()
