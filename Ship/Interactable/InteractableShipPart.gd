class_name InteractableShipPart extends ShipPart

var direction := "horizontal"

var player_in_range = null

var hitboxes_to_shift = []

func init(_ship, _coords : Vector2i, _durability : float = 10, _mass : float = 1):
	super(_ship, _coords, _durability, _mass)

func _physics_process(_delta: float) -> void:
	for hitbox in hitboxes_to_shift:
		hitbox.position = (- ship.difference_in_position).rotated(-global_rotation)
		# if direction == "horizontal":
		# 	hitbox.position = (- ship.difference_in_position).rotated(-global_rotation)
		# elif direction == "vertical":
		# 	hitbox.position = (- ship.difference_in_position).rotated(-global_rotation)

func interact():
	_interact()

func _interact(): # VIRTUAL METHOD
	pass
