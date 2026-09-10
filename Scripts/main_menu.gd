extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")


func _on_settings_pressed() -> void:
	$VBoxContainer.visible = false
	$Options.visible = true
	$Options/VBoxContainer/VBoxContainer/Volume_Slider.value = Globals.volume


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_button_leaderboard_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Leaderboard.tscn")


func _on_back_pressed() -> void:
	$VBoxContainer.visible = true
	$Options.visible = false


func _on_volume_slider_value_changed(value: float) -> void:
	Globals.volume = value
