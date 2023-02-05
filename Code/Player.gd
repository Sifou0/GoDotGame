extends KinematicBody2D

onready var bullet = preload("res://Scene/Bullet.tscn")
var b

export var speed = 400
export var jump_impulse = 20
export var bDir = 0
var velocity = Vector2(0,0)
const SPEED = 180
const GRAVITY = 30
const JUMPFORCE = -750
var HP = 10
var screen_size
var isBoss = false

func _ready():
	screen_size = get_viewport_rect().size
	if get_parent().name == "Levelboss":
		$Camera2D.zoom = Vector2(0.5,0.5)
	else:
		$Camera2D.zoom = Vector2(1,1)
		$Camera2D.limit_left = 0
		$Camera2D.limit_right = 720
		isBoss = true

func takeDmg(dmg):
	HP -= dmg
	if HP <= 0:
		onDeath()

func onDeath():
	queue_free()

func _physics_process(delta):
	if Input.is_action_pressed("move_right"):
		velocity.x = SPEED
		bDir = 0
		$AnimatedSprite.play("walk")
		$Position2D.position.x = 20
	elif Input.is_action_pressed("move_left"):
		velocity.x = -SPEED
		bDir = PI
		$AnimatedSprite.play("walk")
		$Position2D.position.x = -20
	elif Input.is_action_just_pressed("shoot"):
		b = bullet.instance()
		if isBoss:
			b.setDir(-PI/2)
			b.setIsBoss()
			$Position2D.position.x = 0
			$Position2D.position.y = -20
		else:
			b.setDir(bDir)
		get_parent().add_child(b)
		b.global_position = $Position2D.global_position
	else:
		$AnimatedSprite.play("stay")
	velocity.y += GRAVITY
	
	if not is_on_floor():
		$AnimatedSprite.play("jump")
	
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMPFORCE
		
	velocity = move_and_slide(velocity,Vector2.UP)
	
	velocity.x = lerp(velocity.x,0,0.2)
