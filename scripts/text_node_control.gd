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
                print("end of string ", index)
            else:
                PrintText(dialog_block)



func PrintText(_dialog:Array):
    var string:String = _dialog[index]
    # comparo 'string' para decidir accion
    match string:
        "_yes_no":
            buttons_class.Two_Buttons(container, "yes", "no") 
            Connect_Childs()
            can_use_space = false
        _:
            text_area.text = _dialog[index]
        

func Connect_Childs():
    for childs in range(container.get_child_count()-1, -1, -1):
        container.get_child(childs).pressed.connect(_button_pressed)
    pass


func _button_pressed():
    index += 1
    for child in range(container.get_child_count()-1, -1, -1):
        container.get_child(child).queue_free()
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
