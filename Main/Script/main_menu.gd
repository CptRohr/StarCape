extends Control

#this is fcuked
func _on_start_game_pressed():
	get_tree().change_scene_to_file("res://Main/Scene/MainScene.tscn")

func _on_quit_pressed():
	get_tree().quit()
