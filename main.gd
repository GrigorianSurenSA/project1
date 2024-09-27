extends Node2D

var enemy = preload("res://enemy.tscn")

func _ready():
	$Timer.wait_time = 3
	spawn_enemies()
	
func spawn_enemies():
	for x in 9:
		if x % 2 == 0:
			for y in 1:
				var e = enemy.instantiate()
				var pos = Vector2(x * (16 + 8) + 24, 20*(y+1) - 200)
				add_child(e)
				e.position = pos
	$Timer.start()
			

func _on_timer_timeout() -> void:
	spawn_enemies()
