extends Control
var player_name
var score = Globals.currentTime

func _on_button_pressed() -> void:
	print("moin")
	
func _on_submit_pressed() -> void:
	if $LineEdit.text != "":
		player_name = $LineEdit.text
		LocalLeaderboardSingleton.add_score(player_name, score)
		get_tree().change_scene_to_file("res://Scenes/Leaderboard.tscn")
