extends Node2D

@onready var text_area:RichTextLabel = get_node("TextArea")
@onready var container:VBoxContainer = get_node("Container")
@onready var buttons_class := ButtonsClass.new()
var index:int = -1
var scene_dialog:TutorialDialog # hardcoded cambiar en el futuro
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
    # checo que var string contenga una de las palabras que uso de comando en el array de dialogo
    # si es una de ellas, ejecuto accion si no imprime texto
    if string.contains("create_two_buttons"):
        # array[0] = command
        # array[1] = button 1 title
        # array[2] = button 2 title
        # array[3] = button 1 value
        # array[4] = button 2 value
        var splited_array:Array = string.split(" ")
        buttons_class.Create_Two_Buttons(container, splited_array[1],splited_array[2],splited_array[3], splited_array[4]) 
        Connect_Childs_Button_Pressed()
        can_use_space = false
    elif string.contains("create_button"):
        # divide el string en palabras y lo almacena en un array(new_array)
        # uso  este array para pasar cada palabra pro su indice a Create_Button()
        # new_array = var splited_array
        # new_array[0] = comand
        # new_array[1] = title
        # new_array[2] = value
        var splited_array:Array = string.split(" ")
        buttons_class.Create_Button(container , splited_array[1], splited_array[2])
        Connect_Childs_Button_Pressed()
        can_use_space = false
    else:
        text_area.text = _dialog[index]
        

func Connect_Childs_Button_Pressed():
    # a cada child conecta la senal de _button_pressed
    for child in range(0, container.get_child_count()):
        container.get_child(child).pressed.connect(_button_pressed)
    pass


func _button_pressed():
    #se encarga  de destruir los childs de container(botones) , avanzar el texto y reabilita  el uso de space key
    # kill all childs!
    for child in range(container.get_child_count()-1, -1, -1):
        container.get_child(child).queue_free()
    index += 1
    text_area.text = dialog_block[index]
    can_use_space = true

    
func SelectDialogue():

    # TODO: ESTA HARCODE ELEGIR EL DIALOGO, VOY A QUERER QUE LO ELIGA DINAMICAMENTE

    scene_dialog = TutorialDialog.new()
    dialog_block = scene_dialog.test1
    pass

func Debug():

    if Input.is_action_just_pressed("e"):
        # print("current scene: ", current_scene)
        print("current index: " , index)
        # print(container.get_child_count()-1)
        # print(dialog_block[3].split(" ")[1])
        pass
