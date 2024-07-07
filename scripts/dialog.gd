class_name TutorialDialog


var nombre = "bento-chan"
# ---------------------------------------------------------------------------
# FORMATO para comandos: "nombre_comando title1 title2 value1 value2"       #
# ---------------------------------------------------------------------------

# mas adelante me voy a encontrar con el problema que el titulo va a ser mas de una palabra, en vez de separarlas con " " separarlas con "_' y  cambiar "_" por " " en esa palabra
var test1 := [
    "Hola " + nombre, 
    "Esta es una prueba de dialogo, en esta prueba quiero intentar tres cosas: ",
    "Uno, crear un boton de opcion",
    "create_button ok? prueba1" ,
    "Dos, crear dos botones, representando cierto o falso",
    "create_two_buttons cierto falso true false",
    "Y por ultimo, cambiar de branch dependiendo de que respondiste",
    


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


]





