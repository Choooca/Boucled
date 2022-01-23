extends KinematicBody2D
var rota = .2 

func _physics_process(delta):
	rotation -= rota
