extends Node

var scores: Array = []
const SAVE_PATH := "user://leaderboard.json"
const MAX_ENTRIES := 10

func _ready() -> void:
	load_scores()


func load_scores() -> void:
	if FileAccess.file_exists(SAVE_PATH):
		var file: FileAccess = FileAccess.open(SAVE_PATH, FileAccess.READ)
		var text: String = file.get_as_text()
		var parsed: Variant = JSON.parse_string(text)

		if parsed is Array:
			scores = parsed
		else:
			scores = []
	else:
		scores = []


func add_score(player_name: String, score_value: float) -> void:
	var entry: Dictionary = {
		"name": player_name,
		"score": score_value,
	}

	scores.append(entry)

	# Tri du plus grand score au plus petit
	scores.sort_custom(
		func(a: Dictionary, b: Dictionary) -> bool:
			return float(a["score"]) < float(b["score"])
	)

	if scores.size() > MAX_ENTRIES:
		scores = scores.slice(0, MAX_ENTRIES)

	save_scores()


func save_scores() -> void:
	var file: FileAccess = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var json_text: String = JSON.stringify(scores, "\t")
	file.store_string(json_text)
