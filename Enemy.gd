extends CharacterBody2D

@export var speed: float = 70.0
@export var gravedad: float = 980.0   # nota: valor en pix/s^2
@onready var stomp_area = $StompArea
@onready var hurt_area = $HurtArea

func _ready():
	# empieza hacia la izquierda
	velocity.x = -speed
	$AnimatedSprite2D.play("run")

	# Asegurarse de que las Areas monitoricen
	stomp_area.monitoring = true
	stomp_area.monitorable = true
	hurt_area.monitoring = true
	hurt_area.monitorable = true

	# conectar señales (puedes también conectarlas desde el editor)
	stomp_area.connect("body_entered", Callable(self, "_on_stomp_body_entered"))
	hurt_area.connect("body_entered", Callable(self, "_on_hurt_body_entered"))

func _physics_process(delta):
	# gravedad con delta (importante)
	velocity.y += gravedad * delta

	# movimiento horizontal y cambio de dirección al chocar con pared
	if is_on_wall():
		velocity.x = -velocity.x
		$AnimatedSprite2D.flip_h = velocity.x > 0

	move_and_slide()

	# DEBUG: ver colisiones de slide (opcional)
	#for i in range(get_slide_collision_count()):
	#	var col = get_slide_collision(i).get_collider()
	#	if col:
	#		print("slide collision with:", col.name)

# Stomp = jugador cae encima del enemigo
func _on_stomp_body_entered(body):
	print("StompArea entered by:", body)
	if not body: return
	if body.is_in_group("player"):
		print("ENEMIGO STOMPEADO!")
		# rebotar jugador si tiene bounce()
		if body.has_method("bounce"):
			body.bounce()
		# animación / partículas opcional aquí
		queue_free()

# Hurt = daño al jugador por contacto lateral
func _on_hurt_body_entered(body):
	print("HurtArea entered by:", body)
	if not body: return
	if body.is_in_group("player"):
		# llama a die() en el player si existe, si no recarga escena
		if body.has_method("die"):
			body.die()
		else:
			get_tree().reload_current_scene()
