extends CanvasLayer

var left_pressed = false
var right_pressed = false
var jump_pressed = false

func _ready():
	$LeftButton.button_down.connect(_on_left_down)
	$LeftButton.button_up.connect(_on_left_up)

	$RightButton.button_down.connect(_on_right_down)
	$RightButton.button_up.connect(_on_right_up)

	$JumpButton.button_down.connect(_on_jump_down)
	$JumpButton.button_up.connect(_on_jump_up)

func _on_left_down():
	left_pressed = true

func _on_left_up():
	left_pressed = false

func _on_right_down():
	right_pressed = true

func _on_right_up():
	right_pressed = false

func _on_jump_down():
	jump_pressed = true

func _on_jump_up():
	jump_pressed = false

func _process(_delta):
	if left_pressed:
		Input.action_press("ui_left")
	else:
		Input.action_release("ui_left")

	if right_pressed:
		Input.action_press("ui_right")
	else:
		Input.action_release("ui_right")

	if jump_pressed:
		Input.action_press("ui_up")
	else:
		Input.action_release("ui_up")
