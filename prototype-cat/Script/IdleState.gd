class_name IdleState
extends State

func _init(player: Player):
	super(player)
	
func enter() -> void:
	pass

func update(delta:float) -> void:
	print("Parado")
	

func fixed_update(delta:float) -> void:
	var input_vector = Input.get_vector("move_right","move_left","move_up","move_down")
	if input_vector != Vector2.ZERO:
		player.state_machine.transition_to(WalkState.new(player))
	

func exit()->void:
	pass
	
	
