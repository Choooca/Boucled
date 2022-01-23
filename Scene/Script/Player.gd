extends KinematicBody2D
onready var precube = preload("res://Scene/Cube.tscn")
const SPEED := 20000
const JUMPFORCE := -1800
const GRAVITY := 6700
var velocity:Vector2 = Vector2.ZERO
var tabcube = []

func _ready():
	pass
	
func _physics_process(delta):
	get_input()
	velocity.y += GRAVITY * delta
	velocity.x *= delta
	velocity = move_and_slide(velocity, Vector2.UP)
	for index in get_slide_count():
		var collision = get_slide_collision(index)
		if collision.collider.name == "Finish":
			get_parent().current_map.finish = true
	
func get_input():
	if Input.is_action_pressed("left"):
		velocity.x = -SPEED
	if Input.is_action_pressed("right"):
		velocity.x = SPEED
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMPFORCE
	if Input.is_action_just_pressed("freeze"):
		freeze()

func freeze():
	var cube = precube.instance()
	tabcube.append(cube)
	get_parent().add_child(cube)
	cube.position = position
	get_parent().reload_current_map()

func reset_cube():
	for cube in tabcube:
		cube.queue_free()
	tabcube.clear()
