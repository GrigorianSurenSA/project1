extends Area2D
@export var cooldown = 2
@export var speed = 150
@onready var screensize = get_viewport_rect().size
var can_shoot = false
var bullet_scene = preload("res://enemy_bullet.tscn")

func _ready() -> void:
	$Timer.wait_time = cooldown

func _process(delta: float) -> void:
	shoot()
	position.y += speed * delta
	
	
func explode():
	queue_free()

#	func _on_area_entered(area: Area2D) -> void:
#	if area.is_in_group("players"):
#		area.explode()
#		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free() # Replace with function body.

func shoot():
	if not can_shoot:
		return
	can_shoot = false
	$Timer.start()
	var b = bullet_scene.instantiate()
	get_tree().root.add_child(b)
	b.start(position + Vector2(0, 10))
	
func _on_timer_timeout() -> void:
	can_shoot = true
