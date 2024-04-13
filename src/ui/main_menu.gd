class_name MainMenu extends PanelContainer


@onready var _start_button := %StartButton as Button


func _ready():
    _start_button.pressed.connect(func(): Signals.start_pressed.emit())
