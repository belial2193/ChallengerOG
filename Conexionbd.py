import pymysql

class DataBase:	
	# Abrir conexion con la BD
	def __init__(self):
		self.db = pymysql.connect(
			host='localhost',
			user='root',
			password='123456',
			db='bd_meli_challenger'
		)
		self.cursor = self.db.cursor()

	#Limpiar Base de datos
	def delete_data(self, table):
		sql = "DELETE FROM {} ".format(table)	
		try:
			self.cursor.execute(sql)
			self.db.commit()

		except Exception as e:
			self.db.rollback()
			print("ERROR al eliminar, revisar")
			raise 
		return		


	#ingresar la nomina a la BD
	def insertdb_nomina(self,usercc, username, useremail, userposition):
		sql = "INSERT INTO nomina (usercc, username, useremail, userposition) VALUES ( '{}','{}','{}','{}')".format(usercc, username, useremail, userposition)
		try:

			self.cursor.execute(sql)
			self.db.commit() 

		except Exception as e:
			self.db.rollback()
			print("ERROR al insertar nomina, revisar")
			raise 
		return

	
	def insertdb_inventariobd(self, bdname, bdclassification):
		sql = "INSERT INTO inventariobd (bdname, bdclassification) VALUES ( '{}','{}')".format(bdname, bdclassification)
		try:

			self.cursor.execute(sql)
			self.db.commit() 

		except Exception as e:
			self.db.rollback()
			print("ERROR al insertar inventariobd, revisar")
			raise 
		return

	def insertdb_jefes(self, idowner, idmanager):
		sql = "INSERT INTO jefes (idowner, idmanager) VALUES ( '{}','{}')".format(idowner, idmanager)
		try:

			self.cursor.execute(sql)
			self.db.commit() 

		except Exception as e:
			self.db.rollback()
			print("ERROR al insertar jefes, revisar")
			raise 
		return


	def insertdb_owners(self, bdname, usercc):
		sql = "INSERT INTO bdowners (bdname, usercc) VALUES ( '{}','{}')".format(bdname, usercc)
		try:

			self.cursor.execute(sql)
			self.db.commit() 

		except Exception as e:
			self.db.rollback()
			print("ERROR al insertar jefes, revisar")
			raise 
		return


	#Insertar valores en BD bdsmeli
	def insert_values(self,BDname,BDowner_email,BDmanager_email,BDClassification):

		sql = "INSERT INTO revalida (bdname, owneremail, manageremail, bdclassification) VALUES ( '{}','{}','{}','{}')".format(BDname,BDowner_email,BDmanager_email,BDClassification)

		try:
			self.cursor.execute(sql)
			self.db.commit() 

		except Exception as e:
			self.db.rollback()
			print("ERROR al insertar, revisar")
			raise 
		return		

	
#Cerrar la conexión
	def close_session(self):
		self.db.close()
