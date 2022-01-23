extends Node2D
onready var Map1 = preload("res://Scene/Map/Map1.tscn")
onready var Map2 = preload("res://Scene/Map/Map2.tscn")
onready var Map3 = preload("res://Scene/Map/Map3.tscn")
onready var Map4 = preload("res://Scene/Map/Map4.tscn")
onready var Map5 = preload("res://Scene/Map/Map5.tscn")
onready var FinishScreen = preload("res://Scene/Finish_screen.tscn")
var map = []
var number = 0
var finish
var current_map
var stars

func _ready():
	map = [Map1, Map2, Map3, Map4, Map5]
	current_map = map[number].instance()
	add_child(current_map)

func change_room():
	current_map.queue_free()
	number += 1
	current_map = map[number].instance()
	add_child(current_map)
	$Player.reset_cube()

func reload_current_map():
	current_map.queue_free()
	current_map = map[number].instance()
	add_child(current_map)
	
func finish():
	finish = FinishScreen.instance()
	add_child(finish)
	get_tree().paused = true
