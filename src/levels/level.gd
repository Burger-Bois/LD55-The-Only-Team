class_name Level extends Node2D


const DEFAULT_CELL_VALUE := null

# Temporary
@onready var player := $Actor as Actor

var _actor_coords: Dictionary

# Array[Array[Actor]]
var _grid: Array[Array]


func _init():
    for column_i in Constants.GRID_SIZE.x:
        var column := []
        for row_i in Constants.GRID_SIZE.y:
            column.append(DEFAULT_CELL_VALUE)
        _grid.append(column)


func _ready():
    update_actor_positions()


func _input(event: InputEvent):
    if event is InputEventMouseButton \
            and event.button_index == MOUSE_BUTTON_LEFT \
            and event.pressed:
        player.set_coords(mouse_coordinates())
        update_actor_positions()


func upsert_actor(actor: Actor):
    if _actor_coords.has(actor):
        # Remove actor from old coordinates
        var old_coords := _actor_coords[actor] as Vector2i
        _grid[old_coords.x][old_coords.y] = null

    _grid[actor.get_coords().x][actor.get_coords().y] = actor
    _actor_coords[actor] = actor.get_coords()


func mouse_coordinates() -> Vector2i:
    return floor(Vector2i(get_local_mouse_position()) / Constants.CELL_SIZE)


func update_actor_positions():
    for column_i in range(_grid.size()):
        var column = _grid[column_i]
        for row_i in range(column.size()):
            var actor = column[row_i] as Actor
            if is_instance_valid(actor):
                actor.position = \
                        Vector2(column_i, row_i) * Vector2(Constants.CELL_SIZE) \
                        + Vector2(Constants.CELL_SIZE) / 2
