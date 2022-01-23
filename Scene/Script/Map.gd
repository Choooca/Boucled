extends Node2D
class_name Map
onready var Player = get_tree().get_root().get_node("Main/Player")
var finish
var stars = []

func _ready():
	finish = false
	Player.position = $Spawn.position
	
func _physics_process(delta):
	if is_off_screen_y(Player):
		get_parent().reload_current_map()
		Player.reset_cube()
	if is_off_screen_x(Player) and finish:
		get_tree().get_root().get_node("Main").finish()
		get_tree().get_root().get_node("Main").finish.stars(stars)
	

func is_off_screen_y(vec) -> bool:
	if vec.position.y > get_viewport().size.y:
		return true
	else:
		return false
		
func is_off_screen_x(vec) -> bool:
	if vec.position.x > get_viewport().size.x:
		return true
	else:
		return false
