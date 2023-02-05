extends Node2D

var enemies_left

func _process(delta):
	enemies_left = get_tree().get_nodes_in_group("Enemies").size()
	set_score(enemies_left)
	print(enemies_left)

func set_score(val):
	enemies_left = val
	get_node("HUD/enemies_lft").set_text("Enemies left : "+ str(enemies_left))
