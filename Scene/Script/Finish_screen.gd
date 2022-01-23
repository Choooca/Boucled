extends CanvasLayer
onready var Player = get_tree().get_root().get_node("Main/Player")
onready var Stars1 = $PanelContainer/MarginContainer2/HBoxContainer/Stars1
onready var Stars2 = $PanelContainer/MarginContainer2/HBoxContainer/Stars2
onready var Stars3 = $PanelContainer/MarginContainer2/HBoxContainer/Stars3

func _on_Restart_pressed():
	get_tree().get_root().get_node("Main").reload_current_map()
	Player.reset_cube()
	get_tree().paused = false
	queue_free()

func _on_Next_pressed():
	get_tree().get_root().get_node("Main").change_room()
	get_tree().paused = false
	queue_free()

func stars(stars):
	var numcube = len(Player.tabcube)
	if numcube > stars[0]:
		Stars1.visible = false
	else:
		Stars1.visible = true
	if numcube > stars[1]:
		Stars2.visible = false
	else:
		Stars2.visible = true
	if numcube > stars[2]:
		Stars3.visible = false
	else:
		Stars3.visible = true
