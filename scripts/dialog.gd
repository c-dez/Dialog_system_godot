class_name TutorialDialog


var nombre = "qwer"

# FORMAT para comandos "nombre_comando title value"

# mas adelante me voy a encontrar con el problema que el titulo va a ser mas de una palabra, en vez de separarlas con " " separarlas con "_' y  cambiar "_" por " " en esa palabra
var test1 := [
    "0", 
    "create_button ok qwerty2",
    "1",
    "create_two_buttons yes no true false" ,
    "3",
    "4",
    "create_two_buttons yes no true false",
    "6?",


]

var test2 := [
    "Esta es dialog test 2",
    "lo voy a usar para probar branching",
]

var test3 := [
    "Y este es test 3",
    "tambien lo voy a usar para probar branching",
]

var seleccion = [
    "seleccionaste: ",
    # test(),


]



var test = func Test():
    print("funcTest")

