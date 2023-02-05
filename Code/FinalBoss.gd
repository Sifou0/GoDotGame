extends KinematicBody2D

onready var bullet = preload("res://Scene/Bullet.tscn")
var b
var angles = [PI/4,PI/2,3*PI/4]
var ind = 0
var frame = 0
var HP = 10

func _ready():
	$Position.play("Nouvelle animation")

func _process(delta):
	if frame % 20 == 0:
		b = bullet.instance()
		b.setIsBoss()
		b.setDir(angles[ind%3])
		get_parent().add_child(b)
		b.global_position = $Position2D.global_position
		ind += 1
	frame += 1

func takeDmg(dmg):
	HP -= dmg
	if HP <= 0:
		onDeath()
	print(HP)

func onDeath():
	queue_free()
