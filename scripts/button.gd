extends Button

var value

# func _init():
#     print(text)

func _physics_process(_delta):
    pressed.connect(_button_pressed)

func _button_pressed():
    print("pressed: ", text)