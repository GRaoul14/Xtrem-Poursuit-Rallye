extends Node


#Wird in dem Skript Car_Movement und der Funktion _physics_process(delta) genutzt.
var counting_finished = false


#Wird in dem Skript timer und der Funktion _process(delta) genutzt. 
var time: float = 0.0 #-> Rohe Version der gemessenen Zeit nach dem abgeschlossen Counter.
var minutes: int = 0 #-> time wird in minutes umgerechnet.
var seconds: int = 0 #-> time wird in seconds umgerechnet.
var msec: int = 0 #-> time wird in msec umgerechnet.

#Wird in dem Skript Main verwendet, um zu überprüfen, ob das Rennen beendet wurde
var is_Finished = false

#Wird in dem Skript Main verwendet, um die Lautstärke des Motors zu verändern
var volume: float = 50.0

#Wird in dem Skript Sounds verwendet, um den Pitch auf die Autogeschwindigkeit anzupassen
var car_Speed

#Wird in dem Skript LocalLeaderboard verwendet um die Scores zu speichern und weiterzugeben
var currentTime

func get_time_formatted() -> String:
	return "%02d : %02d : %03d" % [minutes, seconds, msec]
