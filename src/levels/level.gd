class_name Level extends Node2D


const DEFAULT_CELL_VALUE := null

# Temporary
@onready var player := $Actor as Actor

@onready var _mouse_grid := $MouseGrid as MouseGrid
@onready var _line := $Line as Line

var _actor_coords: Dictionary
var _grid: Array[Array] # Array[Array[Actor]]


func _init():
    for column_i in Grid.GRID_SIZE.x:
        var column := []
        for row_i in Grid.GRID_SIZE.y:
            column.append(DEFAULT_CELL_VALUE)
        _grid.append(column)


func _ready():
    _mouse_grid.mouse_cell_entered.connect(update_line)

    update_actor_positions()


func _input(event: InputEvent):
    if event is InputEventMouseButton \
            and event.button_index == MOUSE_BUTTON_LEFT \
            and event.pressed:
        player.set_coords(mouse_coordinates())
        update_actor_positions()
        update_line()


func upsert_actor(actor: Actor):
    if _actor_coords.has(actor):
        # Remove actor from old coordinates
        var old_coords := _actor_coords[actor] as Vector2i
        _grid[old_coords.x][old_coords.y] = null

    _grid[actor.get_coords().x][actor.get_coords().y] = actor
    _actor_coords[actor] = actor.get_coords()


func mouse_coordinates() -> Vector2i:
    return floor(Vector2i(get_local_mouse_position()) / Grid.CELL_SIZE)


func update_actor_positions():
    for column_i in range(_grid.size()):
        var column = _grid[column_i]
        for row_i in range(column.size()):
            var actor = column[row_i] as Actor
            if is_instance_valid(actor):
                actor.position = \
                        Vector2(column_i, row_i) * Vector2(Grid.CELL_SIZE) \
                        + Vector2(Grid.CELL_SIZE) / 2


func update_line():
    var line := get_line(player.get_coords(), mouse_coordinates())
    if line.size() > 1:
        _line.set_cells(line.slice(1))
    else:
        _line.set_cells([])


# Copied and modified from https://forum.godotengine.org/t/tile-based-line-drawing-algorithm-efficiency/26998
func get_line(p0: Vector2i, p1: Vector2i) -> Array[Vector2i]:
    var points = [] as Array[Vector2i]
    var dx = abs(p1.x - p0.x)
    var dy = -abs(p1.y - p0.y)
    var err = dx + dy
    var e2 = 2 * err
    var sx = 1 if p0.x < p1.x else -1
    var sy = 1 if p0.y < p1.y else -1
    while true:
        points.append(Vector2i(p0.x, p0.y))
        if p0.x == p1.x and p0.y == p1.y:
            break
        e2 = 2 * err
        if e2 >= dy:
            err += dy
            p0.x += sx
        if e2 <= dx:
            err += dx
            p0.y += sy
    return points
