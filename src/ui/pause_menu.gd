class_name PauseMenu extends PanelContainer


@onready var _resume_button := %ResumeButton as Button
@onready var _main_menu_button := %MainMenuButton as Button


func _ready():
    _resume_button.pressed.connect(func(): Signals.resume_pressed.emit())
    _main_menu_button.pressed.connect(func(): Signals.main_menu_pressed.emit())
