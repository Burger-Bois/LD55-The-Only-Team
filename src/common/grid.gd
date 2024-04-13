extends Node


const GRID_SIZE := Vector2i(12, 12)
const CELL_SIZE := Vector2i(16, 16)


func to_position(coords: Vector2i) -> Vector2:
    return Vector2(coords * CELL_SIZE)


func to_position_centre(coords: Vector2i) -> Vector2:
    return to_position(coords) + Vector2(CELL_SIZE) / 2


func get_cells() -> Array[Vector2i]:
    var cells := [] as Array[Vector2i]
    for x in GRID_SIZE.x:
        for y in GRID_SIZE.y:
            cells.append(Vector2i(x, y))
    return cells
