extends Node

onready var bullet_manager = $BulletManager
onready var player = $BulletManager

# Called when the node enters the scene tree for the first time.
func _ready():
	player.connect("bullet_fired",bullet_manager,"handle_bullet_spawned")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
