# GestionGaraje.gd (Autoload)
extends Node

var dinero: int = 5000 # Dinero inicial

# Base de datos de vehículos disponibles
var catalogo = {
	"Camioneta_Base": {"precio": 0, "escena": preload("res://vehicles/Camioneta.tscn"), "comprado": true},
	"Camioneta_Heavy": {"precio": 3000, "escena": preload("res://vehicles/camioneta_heavy.tscn"), "comprado": false},
	"Grua_Rescate": {"precio": 7000, "escena": preload("res://vehicles/grua.tscn"), "comprado": false}
}

func comprar_vehiculo(nombre_id: String) -> bool:
	var v = catalogo[nombre_id]
	if dinero >= v.precio and not v.comprado:
		dinero -= v.precio
		v.comprado = true
		print("Compraste: ", nombre_id)
		return true
	return false

func vender_vehiculo(nombre_id: String):
	var v = catalogo[nombre_id]
	if v.comprado and v.precio > 0:
		dinero += v.precio * 0.5 # Se vende a mitad de precio
		v.comprado = false
		print("Vendiste: ", nombre_id)
