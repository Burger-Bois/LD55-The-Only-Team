class_name MouseGrid extends Area2D


signal mouse_cell_entered


func _ready():
    mouse_shape_entered.connect(_on_mouse_shape_entered)


func _enter_tree():
    for coords in Grid.get_cells():
        add_cell_shape(coords)


func add_cell_shape(coords: Vector2i):
    var shape := RectangleShape2D.new()
    shape.size = Grid.CELL_SIZE

    var collision_shape := CollisionShape2D.new()
    collision_shape.position = Grid.to_position_centre(coords)
    collision_shape.shape = shape

    add_child(collision_shape)


func _on_mouse_shape_entered(_shape):
    mouse_cell_entered.emit()
