class_name PlayerSaveFile extends Resource

@export var position : Vector2
@export var acceleration : Vector2
@export var currency : int
@export var suit : bool
@export var health : int

static func save() -> PlayerSaveFile:
    var file = PlayerSaveFile.new()

    file.position = World.instance.get_distance_from_center(Player.main_player.global_position)
    file.acceleration = Player.main_player.acceleration
    
    file.health = Player.main_player.health
    file.currency = Player.main_player.currency
    file.suit = Player.main_player.suit

    return file


func load():
    var player = Player.main_player
    player.spawn(position, acceleration)
     
    player.set_health(health)
    player.suit = suit
    player.currency = currency
    player.currency_updated_signal.emit()
