class_name UI extends Control


@onready var _main_menu := %MainMenu as MainMenu


func hide_main_menu():
    _main_menu.hide()


func show_main_menu():
    _main_menu.show()
