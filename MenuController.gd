extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Menus = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func togglePanel(menu, parameter, valueOpen, valueClosed):
	if menu.IsOpen:
		var index = 0
		if Menus.find(menu) == 0:
			index = Menus.size()
		else:
			index = Menus.size() - Menus.find(menu)
		var currentMenus = Menus
		for i in range(index -1, -1, -1):
			currentMenus[Menus.size() - i - 1].CloseMenu(parameter, valueClosed)
			currentMenus.remove(Menus.size() - i - 1)
		Menus = currentMenus
	else:
		menu.OpenMenu(parameter, valueOpen)
		Menus.append(menu)

func _on_Option_Button_button_down():
	togglePanel( $"Panels/Options Menu", "rect_size", Vector2(325,267), Vector2(0,267))
	pass # Replace with function body.


func _on_Player_Button_button_down():
	togglePanel($"Panels/Player Menu", "modulate",Color(1,1,1,1), Color(1,1,1,0))
	pass # Replace with function body.


func _on_Button_button_down():
	togglePanel($"Panels/Fade Menu", "modulate",Color(1,1,1,1), Color(1,1,1,0))
	pass # Replace with function body.


func _on_Button2_button_down():
	togglePanel($"Panels/Fade Menu2", "modulate",Color(1,1,1,1), Color(1,1,1,0))
	pass # Replace with function body.
