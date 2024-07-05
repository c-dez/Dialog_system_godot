class_name ButtonsClass
extends Node
# ESTA CLASE CONTIENE METODOS PARA CREAR BOTONES DE SELECCION
var button


func _init():
	button = preload("res://scenes/button.tscn")
	pass

func Create_Two_Buttons(father_node:Container, button1_title:String, button2_title:String, button1_value:String, button2_value:String):
	# crea dos botones y los hace child de father_container, cada boton tiene un titulo
	var a = button.instantiate()
	var b = button.instantiate()
	father_node.add_child(a)
	father_node.add_child(b)
	a.text = button1_title
	b.text = button2_title
	a.value = button1_value
	b.value = button2_value


func Create_Button(_father:Container, _title:String, _value:String):
	var a = button.instantiate()
	_father.add_child(a)
	a.text = _title
	a.value = _value

    



	
	
