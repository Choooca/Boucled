extends Map
var rota = .02

func _ready():
	stars = [2,3,5]
	finish = false

func _physics_process(delta):
	$Rotation/CollisionShape2D.rotation -= rota

func _on_Area2D_body_entered(body):
	if body.name != "Rotation" and body.name != "Player":
		rota = 0
