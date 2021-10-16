extends Node2D

var score = 0

const pipe_make_offset = 1500
const pipe_offet = 250
var next_pipe_pos = 200
var last_playerpos = -10
var pipe = preload("res://Pipe.tscn")

func _physics_process(delta):
	
	var player_pos = $bird.transform.origin.x
	
	if(last_playerpos<next_pipe_pos)and(next_pipe_pos<player_pos):
		var pipe_pos = next_pipe_pos + pipe_make_offset
		next_pipe_pos += pipe_offet
		var pipe_instance=pipe.instance()
		pipe_instance.transform.origin.x = pipe_pos
		add_child(pipe_instance)
	$"/root/Global".set_score(max(0, player_pos-pipe_make_offset)/pipe_offet)
	$Camera2D/Label.text=str(int($"/root/Global".score))
	
	$Camera2D/Label2.text=str(int($"/root/Global".haiscore))

# Declare member variables here. Examples:
# var a = 2
#
# var b = "text"Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


