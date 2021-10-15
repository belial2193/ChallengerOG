import os

from Insumos import*
from Funciones import*
from Conexionbd import*
from envioscorreo import*



#Cargue de los insumos
datos_del_json, usermanager, nomina = import_insumos()

#Guardando información en tablas normalizadas en BD
database = DataBase() 
database.delete_data("revalida")
database.delete_data("bdowners")
database.delete_data("jefes")
database.delete_data("nomina")
database.delete_data("inventariobd")
nomina_a_bd(nomina)
inventario_a_bd(datos_del_json)
jefes_a_bd(usermanager)
owner_a_bd(datos_del_json)
database.close_session()


#Inicializar variables usadas en el correo electrónico
BDname = 0
BDowner_email = 0
BDmanager_email = 0
BDClassification = 0
BDowner_name = 0
BDmanager_name = 0

autenticacion1 = input("ingrese el correo de origen (Gmail): ")
autenticacion2 = input("Ingrese la clave del correo: ")

#Procesar informacion de información para casos de JSON incompleto
for elemento in datos_del_json.values():
	for x in range(len(elemento)):
		BDname = elemento[x][0]
		BDClassification = elemento[x][1]
		if bd_classifcation_check(BDClassification) == 0: 		# No tiene clasificación la bd
			if bd_owner_check (elemento[x][2]) == 0:  			# No tiene owner la bd - Se le asigna al Diretor TI
				BDowner_email = Director_TI_email()
				BDmanager_email	= Director_TI_email()
				BDClassification = "Sin dato"
			else: 											# Si tiene owner
				manager = manager_search(elemento[x][2])
				if manager == 0:  								# No tiene manager el owner - Se le asigna al Director TI
					BDowner_name = owner_name(elemento[x][2])
					BDowner_email = owner_email(elemento[x][2])
					BDmanager_name = Director_TI_name()
					BDmanager_email = Director_TI_email()
					BDClassification = "Sin dato"
				else: 											# Si tiene manager
					BDowner_email = owner_email(elemento[x][2])
					BDmanager_email = manager_email(manager)
					BDClassification = "Sin dato"

		else: 													# Si tiene clasificación
			if bd_owner_check(elemento[x][2]) == 0:				# No tiene Owner - Se ñe asigna Director TI
				BDowner_email = Director_TI_email()
				BDowner_name = "No reporta nombre"
				BDmanager_email	= Director_TI_email()
				BDmanager_name = Director_TI_name()
			else:											# Si tiene owner
				BDowner_email = owner_email(elemento[x][2])
				BDowner_name = owner_name(elemento[x][2])
				manager = manager_search(elemento[x][2])
				if manager == 0:							# No tiene manager el owner - Se le asigna Director de TI
					BDmanager_email = Director_TI_email()
					BDmanager_name = Director_TI_name()
				else:
					BDmanager_email = manager_email(manager)
					BDmanager_name = manager_name(manager)
		
		#Guardar informacion en la BD
		database = DataBase()
		database.insert_values(BDname,BDowner_email,BDmanager_email,BDClassification)
		database.close_session()


		#Envio de correo a BDs Clasificación High
		if BDClassification == "High": 		
			send_email(BDname,BDowner_email,BDmanager_email,BDClassification,BDowner_name, BDmanager_name, autenticacion1, autenticacion2 )

					

