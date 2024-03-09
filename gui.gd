extends CenterContainer

signal button_pressed(button_name)

var grid
var next

const CELL_BG1 = Color(.1, .1, .1)
const CELL_BG2 = Color(0)
# Called when the node enters the scene tree for the first time.
func _ready():
	next = $Panel/HBoxContainer/Left/VBox/CenterContainer/Next
	grid = $Panel/HBoxContainer/Right/Grid
	add_cells(grid, 200)
	clear_cells(grid, CELL_BG1)
	clear_cells(next, CELL_BG2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func add_cells(node, n):
	var num_cells = node.get_child_count()
	while num_cells < n:
			node.add_child(node.get_child(0).duplicate())
			num_cells += 1
func clear_cells(node,color):
	for cell in node.get_children():
		cell.modulate = color


func _on__new_game_button_down():
	emit_signal("buttoned_pressed", "New Game")


func _on__pause_button_down():
	emit_signal("buttoned_pressed", "Pause")


func _on__music_button_down():
	emit_signal("buttoned_pressed", "Music")


func _on__about_button_down():
	$AboutBox.popup_centered()
	emit_signal("buttoned_pressed", "About")
