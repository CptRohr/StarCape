extends Node2D

@onready var pause_menu = $PauseMenu

func _ready():
	pause_menu.visible = false  # hide pause menu on start or something idk

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):  # Default = Esc
		toggle_pause()

func toggle_pause():
	var paused = not get_tree().paused
	get_tree().paused = paused
	pause_menu.visible = paused

func _on_resume_button_pressed():
	get_tree().paused = false
	pause_menu.visible = false

func _on_main_menu_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Main/Scene/main_menu.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
