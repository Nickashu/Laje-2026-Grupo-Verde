extends Control

var mostrar1
var mostrar2
var mostrar3
var mostrar4

func _ready() -> void:
	%ColorRect1.visible = false
	%ColorRect2.visible = false
	%ColorRect3.visible = false
	%ColorRect4.visible = false
	mostrar1 = false
	mostrar2 = false
	mostrar3 = false
	mostrar4 = false

func _physics_process(delta: float) -> void:
	if(mostrar1 == true):
		%ColorRect1.position = lerp(%ColorRect1.position,Vector2(375,100),0.25)
	else:
		%ColorRect1.position = lerp(%ColorRect1.position,Vector2(370,700),0.25)
		
	if(mostrar2 == true):
		%ColorRect2.position = lerp(%ColorRect2.position,Vector2(375,100),0.25)
	else:
		%ColorRect2.position = lerp(%ColorRect2.position,Vector2(370,700),0.25)
		
	if(mostrar3 == true):
		%ColorRect3.position = lerp(%ColorRect3.position,Vector2(375,100),0.25)
	else:
		%ColorRect3.position = lerp(%ColorRect3.position,Vector2(370,700),0.25)
		
	if(mostrar4 == true):
		%ColorRect4.position = lerp(%ColorRect4.position,Vector2(375,100),0.25)
	else:
		%ColorRect4.position = lerp(%ColorRect4.position,Vector2(370,700),0.25)
func LogPopup(log: int):
	
	if(log == 1):
		%ColorRect1.visible = true
		mostrar1 = true
	if(log == 2):
		%ColorRect2.visible = true
		mostrar2 = true
	if(log == 3):
		%ColorRect3.visible = true
		mostrar3 = true
	if(log == 4):
		%ColorRect4.visible = true
		mostrar4 = true

func HideLogPopup():
	Player.frozen = false
	mostrar1 = false
	mostrar2 = false
	mostrar3 = false
	mostrar4 = false
