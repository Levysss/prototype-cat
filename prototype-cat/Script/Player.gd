extends CharacterBody2D
class_name Player

var speed = 300

var state_machine:StateMachine
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_machine = StateMachine.new(self)
	state_machine.transition_to(IdleState.new(self))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	state_machine._process(delta)
	
	pass
	
func _physics_process(delta: float) -> void:
	state_machine._physics_process(delta)
	move_and_slide()
