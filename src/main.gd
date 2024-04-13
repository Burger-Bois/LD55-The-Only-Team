class_name Main extends Node


@export var level_scene: PackedScene

@onready var ui := $UI as Control

var _level: Level


func _ready():
	Signals.start_pressed.connect(start_level)


func _input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		stop_level()


func start_level():
	ui.hide_main_menu()
	_level = level_scene.instantiate() as Level
	add_child(_level)


func stop_level():
	_level.queue_free()
	ui.show_main_menu()
