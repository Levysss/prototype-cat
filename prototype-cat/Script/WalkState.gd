class_name WalkState
extends State


func _init(player: Player):
	super(player)
	
func enter() -> void:
	pass

func update(delta:float) -> void:
	#print("Andando")
	pass

func fixed_update(delta:float) -> void:
	var input_vector = Input.get_vector("move_left","move_right","move_up","move_down")
	player.velocity = input_vector *player.speed
	if input_vector == Vector2.ZERO:
		player.state_machine.transition_to(IdleState.new(player))
	
	

func exit()->void:
	pass
	
