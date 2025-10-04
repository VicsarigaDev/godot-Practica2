extends CharacterBody2D

const snakeRun = 70
const gravedad = 98
var dir = -1  # empieza caminando hacia la izquierda
var alive = true  # controla si el enemigo sigue activo

func _ready():
	velocity.x = dir * snakeRun
	$AnimatedSprite2D.animation = "run"
	$AnimatedSprite2D.play()

	# Conectar señal del Area2D (rectángulo encima)
	$Area2D.body_entered.connect(_on_stomp_area_entered)

func _physics_process(delta):
	if not alive:
		return  # si murió, no procesar movimiento

	# Gravedad
	velocity.y += gravedad * delta

	# Movimiento lateral
	velocity.x = dir * snakeRun
	move_and_slide()

	# Cambiar dirección si choca con pared
	if is_on_wall():
		dir = -dir
		$AnimatedSprite2D.flip_h = dir > 0

	# Detectar colisión lateral con el jugador
	for i in range(get_slide_collision_count()):
		var collision = get_slide_collision(i)
		var other = collision.get_collider()
		if other and other.is_in_group("player"):
			# Reinicia la escena si toca al jugador por los lados
			get_tree().reload_current_scene()

# --- Cuando el jugador cae encima ---
func _on_stomp_area_entered(body):
	if body.is_in_group("player") and alive:
		# Rebote del jugador
		body.velocity.y = -300
		die()
func die():
	queue_free()
