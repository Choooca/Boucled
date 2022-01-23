extends Map
var speed = 1

func _ready():
	stars = [2,4,5]
	finish = false
	
func _physics_process(delta):
	$MovingPlat.position.x -= speed

func _on_Area2D_body_entered(body):
	if body.name !="MovingPlat":
		speed = 0
