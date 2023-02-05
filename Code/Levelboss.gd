extends Node2D

var enemies_left

func _process(delta):
	enemies_left = get_tree().get_nodes_in_group("Enemies").size()
	print(enemies_left)
