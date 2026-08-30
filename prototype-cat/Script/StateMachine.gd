class_name StateMachine
extends Node

var current_state: State
var player: Player

func _init(player_node: Player):
	player = player_node
	

func _ready():
	# Configuração inicial se necessário
	pass

func _process(delta: float):
	if current_state:
		current_state.update(delta)

func _physics_process(delta: float):
	if current_state:
		current_state.fixed_update(delta)


func transition_to(new_state: State) -> void:
	if current_state == new_state:
		return
	
	if current_state:
		current_state.exit()
		current_state.queue_free()  
	
	current_state = new_state
	add_child(current_state)
	current_state.enter()
