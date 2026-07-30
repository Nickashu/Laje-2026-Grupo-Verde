extends Control


func LogPopup(log):
	%LogPopup.popup()

func HideLogPopup():
	Player.frozen = false
	%LogPopup.hide()
