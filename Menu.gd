extends Panel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var IsOpen : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func OpenMenu(parameter, value):
	visible = true
	var tween = get_tree().create_tween()
	tween.tween_property(self, parameter, value, .1)
	IsOpen = true
	pass

func CloseMenu(parameter, value):
	var tween = get_tree().create_tween()
	tween.connect("finished", self, "on_finished")
	tween.tween_property(self,  parameter, value, .1).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN)
	IsOpen = false
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func on_finished():
	visible = false
