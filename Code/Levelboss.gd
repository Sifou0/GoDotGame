extends Node2D

var enemies_left
var my_hp
func _process(delta):
	enemies_left = get_tree().get_nodes_in_group("Enemies").size()

	my_hp = get_node("Player").HP
	set_score(enemies_left)
	set_hp(my_hp)

func set_score(val):
	enemies_left = val
	get_node("HUD/enemies_lft").set_text("Enemies left : "+ str(enemies_left))


func set_hp(val):
	my_hp = val
	get_node("HUD/enemies_lft").set_text("Enemies left : "+ str(enemies_left))
