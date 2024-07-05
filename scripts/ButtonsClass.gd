class_name ButtonsClass
extends Node
# ESTA CLASE CONTIENE METODOS PARA CREAR BOTONES DE SELECCION
var button


func _init():
	button = preload("res://scenes/button.tscn")
	pass

func Two_Buttons(father_node:Container, button1_title:String, button2_title:String):
	# crea dos botones y los hace child de father_container, cada boton tiene un titulo
	var a = button.instantiate()
	var b = button.instantiate()
	father_node.add_child(a)
	father_node.add_child(b)

	a.text = button1_title
	b.text = button2_title
    
func Create_Button(_father:Container, _title:String, _value:String):
	var a = button.instantiate()
	_father.add_child(a)
	a.text = _title
	a.value = _value

    



	
	
