extends KinematicBody2D

var velocity = Vector2()
export var direction = 1
var maxHP = 3
var currHP
onready var bullet = preload("res://Scene/Bullet.tscn")
var b
var frame = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	currHP = maxHP
	if direction == 1:
		$AnimatedSprite.flip_h = false
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction

func _process(delta):
	if frame % 40 == 0:
		b = bullet.instance()
		b.setIsEnemies()
		if direction == 1:
			b.setDir(0)
			$Position2D.position.x = 22
		else:
			b.setDir(PI)
			$Position2D.position.x = -22
		get_parent().add_child(b)
		b.global_position = $Position2D.global_position
	frame += 1

func _physics_process(delta):	
	
	if is_on_wall() or not $floor_checker.is_colliding():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	velocity.y += 20
	
	velocity.x = 50 *direction
	
	velocity = move_and_slide(velocity, Vector2.UP)

func takeDmg(dmg):
	currHP -= dmg
	if currHP <= 0:
		onDeath()

func onDeath():
	queue_free()
