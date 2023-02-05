extends RigidBody2D

var dir = 0
var damage = 1
var lifetime = 0.25
var speed = 400

func _ready():
	apply_impulse(Vector2(),Vector2(speed,0).rotated(dir))
	selfDestruct()
"""
func _physics_process(delta):
	if dir == 0:
		position.x += 10
	else:
		position.x -= 10
"""
func setDir(bdir):
	dir = bdir

func selfDestruct():
	yield(get_tree().create_timer(lifetime),"timeout")
	queue_free()


func _on_Bullet_body_entered(body):
	print("hit")
	self.hide()


