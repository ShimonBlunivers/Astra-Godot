class_name ItemType extends Resource

@export var texture : Texture2D
@export var name : String
@export var nickname : String
@export var shape = Shape2D

func create():
    Item.types[name] = self