extends Node2D

var playerScore = 0
var enemyScore = 0

func _ready():
	_restart_game()

func _process(delta):
	$marcadorJugador.text = str(playerScore)
	$marcadorEnemigo.text = str(enemyScore)

func _restart_game():
	$bola.is_moving = false
	$bola.direction = Vector2.ZERO
	$bola.position = Vector2(960,540)
	#$bola.reset_ball()
	$restartTimer.start()

func _on_arco_izquierda_body_entered(body):
	if body is ball:
		enemyScore += 1
		_restart_game()
func _on_arco_derecha_body_entered(body):
	if body is ball:
		playerScore += 1
		_restart_game()
