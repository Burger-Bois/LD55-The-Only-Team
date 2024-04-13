class_name Level extends Node2D


const DEFAULT_CELL_VALUE := null

# Array[Array[Actor]]
var _grid: Array[Array]


func _init():
    for column_i in Constants.GRID_SIZE.x:
        var column := []
        for row_i in Constants.GRID_SIZE.y:
            column.append(DEFAULT_CELL_VALUE)
        _grid.append(column)


func _ready():
    # Set actor positions based on coordinates
    for column_i in range(_grid.size()):
        var column = _grid[column_i]
        for row_i in range(column.size()):
            var actor = column[row_i] as Actor
            if is_instance_valid(actor):
                actor.position = \
                        Vector2(column_i, row_i) * Vector2(Constants.CELL_SIZE) \
                        + Vector2(Constants.CELL_SIZE) / 2


func add_actor(coords: Vector2i, actor: Actor):
    _grid[coords.x][coords.y] = actor
