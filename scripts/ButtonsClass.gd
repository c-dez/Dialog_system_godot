class_name ButtonsClass
extends Node


var button
func _init():
    button = preload("res://scenes/button.tscn")

    
func Two_Buttons(
    father_node:Container, button1_title:String, button2_title:String):
    # crea dos botones y los hace child de father_container, cada boton tiene un titulo
    var a = button.instantiate()
    var b = button.instantiate()
    father_node.add_child(a)
    father_node.add_child(b)

    a.text = button1_title
    b.text = button2_title

    

    
    
    