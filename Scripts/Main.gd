extends Node2D

func _ready() -> void:
	
	$MotorSoundPlayer.volume_linear = Globals.volume/100

func _process(delta: float) -> void:
	if Globals.is_Finished == true:
		Globals.is_Finished = false
		Globals.counting_finished = false
		Globals.currentTime = Globals.time
		Globals.time = 0
		get_tree().change_scene_to_file("res://Scenes/control.tscn")
	

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
		Globals.is_Finished = false
		Globals.counting_finished = false
		Globals.currentTime = Globals.time
		Globals.time = 0
