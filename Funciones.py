from Insumos import*
from Conexionbd import*

datos_del_json, usermanager, nomina = import_insumos()

def owner_name(owner):
	arr_nomina = nomina.values
	for w in arr_nomina:
		if owner == w[1]:
			return w[0]   #retorna nombre de owner
	return 0

def owner_email(owner): #recibe owner 
	arr_nomina = nomina.values
	for w in arr_nomina:
		if owner == w[1]:
			return w[2]   #retorna correo de owner
	return 0	

def manager_search(owner):   #recibe el ID del Owner
	arr_usermanager = usermanager.values
	for a in arr_usermanager:
		if owner == a[1]:
			return a[3] # retorna el ID del Manager
	return 0

def manager_name(manager): #recibe manager 
	arr_nomina = nomina.values
	for w in arr_nomina:
		if manager == w[1]:
			return w[0]   #retorna nombre de manager
	return 0

def manager_email(manager): #recibe manager 
	arr_nomina = nomina.values
	for w in arr_nomina:
		if manager == w[1]:
			return w[2]   #retorna correo de manager
	return 0		

def bd_classifcation_check(classification):
	if len(int_to_str(classification)) == 0:
		return 0  #sin clasificación la BD
	else:
		return classification  #Con Clasifiación

def bd_owner_check(owner):
	if len(int_to_str(owner))== 0:
		return 0
	else:
		return owner
	return

def Director_TI_email():
	arr_nomina = nomina.values
	for w in arr_nomina:
		if w[3] == "Director TI":
			return w[2]   #retorna correo de director TI
	return 0

def Director_TI_name():
	arr_nomina = nomina.values
	for w in arr_nomina:
		if w[3] == "Director TI":
			return w[0]   #retorna nombre de director TI
	return 0

def Director_TI_id():
	arr_nomina = nomina.values
	for w in arr_nomina:
		if w[3] == "Director TI":
			return w[1]   #retorna ID de director TI
	return 0


def int_to_str(valor):
	try:
		return str(valor)
	except:
		return valor


def nomina_a_bd(nomina):
	database = DataBase()
	#database.delete_data("nomina")
	arr_nomina = nomina.values
	for w in arr_nomina:
		database.insertdb_nomina(w[1], w[0], w[2], w[3])
	return


def inventario_a_bd(datos_del_json):
	database = DataBase()
	for elemento in datos_del_json.values():
		for x in range(len(elemento)):
			if len(int_to_str(elemento[x][1])) == 0:			
				database.insertdb_inventariobd(elemento[x][0], "Sin dato")
			else:
				database.insertdb_inventariobd(elemento[x][0], elemento[x][1]) 
	return


def jefes_a_bd(usermanager):
	database = DataBase()
	arr_usermanager= usermanager.values
	for a in arr_usermanager:
		database.insertdb_jefes(a[1], a[3]) 
	return


def owner_a_bd(datos_del_json):
	database = DataBase()
	for elemento in datos_del_json.values():
		for x in range(len(elemento)):
			if len(int_to_str(elemento[x][2])) == 0:
				database.insertdb_owners(elemento[x][0], Director_TI_id())
			else:
				database.insertdb_owners(elemento[x][0], elemento[x][2]) 
	return