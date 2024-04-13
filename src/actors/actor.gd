class_name Actor extends Node2D


@export
var coords: Vector2i


func _enter_tree():
    var level = get_parent() as Level
    level.add_actor(coords, self)
