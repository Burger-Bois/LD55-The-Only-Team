class_name Line extends Node2D


var _cells: Array[Vector2i]


func _draw():
    print("lmao")
    for cell in get_cells():
        var rect := Rect2(Grid.to_position(cell), Grid.CELL_SIZE)
        draw_rect(rect, Color(255, 0, 0, 0.5))


func get_cells() -> Array[Vector2i]:
    return _cells


func set_cells(cells: Array[Vector2i]):
    _cells = cells
    queue_redraw()

# func draw_grid_line(cells: Array[Vector2i]):
#     print("lol")
#     for cell in cells:
#         var rect := Rect2(cell, Grid.CELL_SIZE)
#         draw_rect(rect, Color(255, 0, 0))

#     queue_redraw()
