class_name UI extends Control


@onready var _main_menu := %MainMenu as MainMenu
@onready var _pause_menu := %PauseMenu as PauseMenu


func hide_main_menu():
    _main_menu.hide()


func show_main_menu():
    _main_menu.show()


func hide_pause_menu():
    _pause_menu.hide()


func show_pause_menu():
    _pause_menu.show()
