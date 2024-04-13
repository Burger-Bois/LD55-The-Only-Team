class_name Actor extends Node2D


@export
var _coords: Vector2i

var _level: Level


func _enter_tree():
    _level = get_parent() as Level
    _level.upsert_actor(self)


func get_coords() -> Vector2i:
    return _coords


func set_coords(coords: Vector2i):
    _coords = coords
    _level.upsert_actor(self)