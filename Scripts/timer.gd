extends CanvasLayer

@onready var count: Label = $count

func _ready() -> void:
	wait_for_counting_finished()
	start_counter()
	
func _process(delta):
	if Globals.counting_finished == true:
		Globals.time += delta
		Globals.msec = fmod(Globals.time, 1) * 1000
		Globals.seconds = fmod(Globals.time, 60)
		Globals.minutes = fmod(Globals.time, 3600) / 60
		$Panel/Minutes.text = "%02d:" % Globals.minutes
		$Panel/Seconds.text = "%02d." % Globals.seconds
		$Panel/Msec.text = "%03d" % Globals.msec
		
func wait_for_counting_finished() -> bool:
	await get_tree().create_timer(3).timeout
	Globals.counting_finished = true
	return Globals.counting_finished
		
func start_counter():
	for i in range(3,0,-1):
		count.text = str(i)
		await get_tree().create_timer(1).timeout
	count.text = "Go!"
	await get_tree().create_timer(2).timeout
	count.visible = false

func stop() -> void:
	set_process(false)
