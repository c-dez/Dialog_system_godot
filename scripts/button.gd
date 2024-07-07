extends Button

var value:String = "default value"


func _ready():
    pressed.connect(_button_pressed)

func _button_pressed():
    print("pressed: ", text," --value: ", value)
    
    # TODO: append el value a un string para almacenar las deciciones tomadas por el jugador


