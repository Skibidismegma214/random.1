extends CharacterBody2D

var velocitat := 200
var gravetat := Vector2.DOWN * 988
var salt := -500
var salts_disponibles = max_salts
var max_salts = 2

func _ready() -> void:
	pass
func _process(delta: float) -> void:
	#Bola2.rotation += 0.2*delta
	var dx = Input.get_axis("moure_esquerra", "moure_dreta")
	velocity.x = 0
	velocity.x += dx * velocitat
	
	if Input.is_action_just_pressed("moure_dalt") and salts_disponibles > 0:
		velocity.y += salt
		salts_disponibles -= 2
	
	velocity += gravetat *  delta
	move_and_slide()
	anima(velocity, delta)
	
	if is_on_floor():
		salts_disponibles = max_salts
	
	
func anima(desplaçament: Vector2, delta: float):
	if Input.is_action_pressed("moure_dreta"):
		$AnimatedSprite2D.play("AnimacioDreta")
	if Input.is_action_pressed("moure_esquerra"):
		$AnimatedSprite2D.play("AnimacioEsquerra")
	
