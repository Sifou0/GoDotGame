extends KinematicBody2D

var velocity = Vector2()
export var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	if direction == 1:
		$AnimatedSprite.flip_h = false
	$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction

func _physics_process(delta):	
	
	if is_on_wall() or not $floor_checker.is_colliding():
		direction = direction * -1
		$AnimatedSprite.flip_h = not $AnimatedSprite.flip_h
		$floor_checker.position.x = $CollisionShape2D.shape.get_extents().x * direction
	velocity.y += 20
	
	velocity.x = 50 *direction
	
	velocity = move_and_slide(velocity, Vector2.UP)

