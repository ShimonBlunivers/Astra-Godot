class_name ShipManager extends Node2D


static var ship_scene = preload("res://Ship/Ship.tscn")

static var instance : ShipManager
static var number_of_ships = 0

func _ready() -> void:
	instance = self

static func new_game():
	ShipManager.spawn_ship(Vector2(0, 0))
	ShipManager.spawn_ship(Vector2(0, -2600), "small_shuttle")
	ShipManager.spawn_ship(Vector2(0, -4000), "small_shuttle")
	Player.main_player.spawn()
	# ShipManager.spawn_ship(Vector2(2000, -2500), "small_shuttle")

static func spawn_ship(_position : Vector2, path : String = "station", custom_object_spawn : CustomObjectSpawn = null, _from_save := false) -> Ship:
	var _ship = ship_scene.instantiate()
	_ship.name = "Ship-" + str(_ship.id)
	instance.add_child(_ship)
	_ship.load_ship(_position, path, custom_object_spawn, false, _from_save)
	return _ship

static func build_ship(_builder : Builder, for_player : bool, path : String = "station") -> Ship:
	var _ship : Ship = ship_scene.instantiate()
	_ship.name = "Ship-" + str(_ship.id)
	instance.add_child(_ship)
	_ship.load_ship(_builder.get_spawn_position(), path, null, true, true)
	_ship.linear_velocity = _builder.ship.linear_velocity
	_ship.rotation = _builder.get_ship_rotation()
	if for_player: 
		if Player.owned_ship != null: 
			Player.main_player.deleting_ship(Player.owned_ship)
			Player.owned_ship.delete()
		Player.owned_ship = _ship

	return _ship

static func get_quest_ship_path(_mission_id : int) -> String:
	return "small_shuttle"
