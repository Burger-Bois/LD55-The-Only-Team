class_name Main extends Node


@export var level_scene: PackedScene

@onready var ui := %UI as Control

var _level: Level


func _ready():
	Signals.start_pressed.connect(start_level)
	Signals.resume_pressed.connect(unpause_level)
	Signals.main_menu_pressed.connect(stop_level)


func _input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		if get_tree().paused:
			unpause_level()
		else:
			pause_level()


func start_level():
	ui.hide_main_menu()
	_level = level_scene.instantiate() as Level
	add_child(_level)


func stop_level():
	unpause_level()

	_level.queue_free()
	_level = null

	ui.show_main_menu()


func pause_level():
	if _level == null:
		# Do nothing
		return

	get_tree().paused = true
	ui.show_pause_menu()


func unpause_level():
	if _level == null:
		# Do nothing
		return

	ui.hide_pause_menu()
	get_tree().paused = false
