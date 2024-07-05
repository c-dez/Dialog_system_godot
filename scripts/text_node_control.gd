extends Node2D

@onready var text_area:RichTextLabel = get_node("TextArea")
@onready var container:VBoxContainer = get_node("Container")
@onready var buttons_class := ButtonsClass.new()

var index:int = -1
var scene_dialog:TutorialDialog
var dialog_block:Array

var can_use_space:bool = true


func _ready():
    SelectDialogue()


func _physics_process(_delta):
    Debug()
    AdvanceText()




func AdvanceText():
    if index < dialog_block.size():    
        if Input.is_action_just_pressed("space") and can_use_space:
            index += 1
            if index >= dialog_block.size():
                print("end of string, index: ", index)
            else:
                PrintText(dialog_block)



func PrintText(_dialog:Array):
    var string:String = _dialog[index]
    # comparo 'string' para decidir accion
    
    # TODO: CREAR UNA FORMA DE CREAR DINAMICAMENTE LOS BOTONES CON TITULO Y VALOR SEGUN EL STRING QUE SE COMPARA
    if string.contains("yes_no"):
        buttons_class.Two_Buttons(container, "yes", "no") 
        Connect_Childs()
        can_use_space = false
    elif string.contains("create_button"):
        buttons_class.Create_Button(container , "1 button", "print this")
        Connect_Childs()
        can_use_space = false
    else:
        text_area.text = _dialog[index]

    # ANTES USABA MATCH PERO CREO QUE IF ELSE SE AJUSTA MEJOR A LO QUE QUIERO
    # match string:
    #     "_yes_no":
    #         buttons_class.Two_Buttons(container, "yes", "no") 
    #         Connect_Childs()
    #         can_use_space = false
    #     "create_button":
    #         buttons_class.Create_Button(container , "1 button", "print this")
    #         Connect_Childs()
    #         can_use_space = false
    #     _:
    #         text_area.text = _dialog[index]
        

func Connect_Childs():
    # a cada child conecta la senal de _button_pressed
    for child in range(0, container.get_child_count()):
        container.get_child(child).pressed.connect(_button_pressed)
    pass


func _button_pressed():
    #se encarga  de destruir los childs de container(botones) , avanzar el texto y reabilita  el uso de space key
    # kill the childs
    for child in range(container.get_child_count()-1, -1, -1):
        container.get_child(child).queue_free()
    index += 1
    text_area.text = dialog_block[index]
    can_use_space = true


    
    

    
func SelectDialogue():
    scene_dialog = TutorialDialog.new()
    dialog_block = scene_dialog.test1
    pass

func Debug():

    if Input.is_action_just_pressed("e"):
        # print("current scene: ", current_scene)
        print("current index: " , index)
        # print(container.get_child_count()-1)

        pass
