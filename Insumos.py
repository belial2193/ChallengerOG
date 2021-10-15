import pandas as pd
import json

#Cargando los insumos
def import_insumos():
	#JSON - Información de la BD
	with open('Insumos/JSONBDS2.json','r') as archivo:
		datos_del_json = json.load(archivo)
	
	#CSV - listado Owner y su Manager
	usermanager = pd.read_csv("../Challenger/Insumos/usuariosymanager.csv")

	#CSV - Nomina de Mercadolibre
	nomina = pd.read_csv("../Challenger/Insumos/Nomina.csv")
	return datos_del_json, usermanager, nomina