extends Area2D

var entered = false
var nextStage = false


func _ready():
	pass # Replace with function body.



func _on_Area2D_body_entered(body: PhysicsBody2D):
	entered = true
	
func verif_enemies():
	if get_tree().get_nodes_in_group("Enemies").size() == 0:
		nextStage = true;

func _on_Area2D_area_exited(area):
	pass # Replace with function body.


func _process(delta):
	verif_enemies()
	if entered == true and nextStage == true:
		get_tree().change_scene("res://Scene/bossStage.tscn")
	
	
