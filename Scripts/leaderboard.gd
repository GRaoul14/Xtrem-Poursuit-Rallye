extends Node2D

@onready var rows_container: VBoxContainer = $Board/HighScores/ScrollContainer/ScoreItemContainer
@onready var close_button: Button = $Board/CloseButtonContainer/CloseButton

const ROW_SCENE: PackedScene = preload("res://Scenes/ScoreItem.tscn")

func _ready() -> void:
	_populate_leaderboard()


func _populate_leaderboard() -> void:
	# Nettoyer les anciennes entrées
	for child in rows_container.get_children():
		child.queue_free()

	var scores = LocalLeaderboardSingleton.scores
	var rank := 1

	for entry in scores:
		var row: Panel = ROW_SCENE.instantiate()

		var name_label: RichTextLabel = row.get_node("PlayerName")
		var score_label: Label        = row.get_node("Score")
		var gold_icon: TextureRect    = row.get_node("GoldIcon")
		var silver_icon: TextureRect  = row.get_node("SilverIcon")
		var bronze_icon: TextureRect  = row.get_node("BronzeIcon")

		# Texte
		
		var msec = fmod(entry["score"], 1) * 1000
		var seconds = fmod(entry["score"], 60)
		var minutes = fmod(entry["score"], 3600) / 60
		
		name_label.text = "%d. %s" % [rank, str(entry["name"])]
		score_label.text = "%02d : %02d : %03d" % [minutes, seconds, msec]

		# Médaille
		gold_icon.visible = false
		silver_icon.visible = false
		bronze_icon.visible = false

		match rank:
			1: gold_icon.visible = true
			2: silver_icon.visible = true
			3: bronze_icon.visible = true

		rows_container.add_child(row)
		rank += 1



func _on_close_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
