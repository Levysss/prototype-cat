extends CharacterBody2D
class_name Player

@onready var bulletPool = $"../BulletsPool"

var cowldownToFire = 0
var speed = 300
var bullet = preload("res://Prefabs/Bullet.tscn")

var state_machine:StateMachine
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_machine = StateMachine.new(self)
	state_machine.transition_to(IdleState.new(self))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	state_machine._process(delta)
	aim(delta)
	pass
	
func _physics_process(delta: float) -> void:
	state_machine._physics_process(delta)
	move_and_slide()
	
func aim(delta:float):
	
	var mouse_position = get_global_mouse_position()
	var player_position = position
	var direction = player_position - mouse_position
	direction.normalized()
	#print(direction.normalized())
	if (Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT)):
		if (cowldownToFire >0):
			cowldownToFire -=delta
		if (cowldownToFire <=0):
			cowldownToFire = 0.2
			var objectBullet = bullet.instantiate()
			objectBullet.position = position
			bulletPool.add_child(objectBullet)
		
		print("click")
	
		
	pass
	
