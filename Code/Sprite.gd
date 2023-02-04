extends Sprite

var dir = 0

func _ready():
	scale = Vector2(0.2,0.2)

func _physics_process(delta):
	if dir == 0:
		position.x += 10
	else:
		position.x -= 10

func setDir(bdir):
	dir = bdir
