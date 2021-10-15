import smtplib

from Funciones import*
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


def send_email(BDname,BDowner_email,BDmanager_email,BDClassification,BDowner_name, BDmanager_name, autenticacion1, autenticacion2):
    remitente = autenticacion1
    destinatario = int_to_str(BDmanager_email)
    password = autenticacion2                           #En la función final pasar este valor por teclado
    asunto = 'Clasificación de bases de datos a su cargo'
    cuerpo = "Cordial saludo " + int_to_str(BDmanager_name) + ". Esperamos que se encuentre muy bien.\n\n\nEn el proceso de reválida de bases de datos identificamos que la base de datos "+int_to_str(BDname)+" que se encuentra a cargo de "+int_to_str(BDowner_name)+" tiene la clasifiación "+int_to_str(BDClassification)+".\n\nSolicitamos su amable colaboración para responde este correo si está de acuerdo con la clasificación o si presenta alguna novedad asociada.\n\n\nQuedamos atentos a sus comentarios.\n\nMuchos éxitos.\n\n\n\nEquipo de Ciberseguridad"


    try:
        # Conexión con el servidor Gmail
        sesion_smtp = smtplib.SMTP('smtp.gmail.com', 587)

        # Cifrado de la conexión
        sesion_smtp.starttls() 

        # Inicio de sesión en el servidor
        sesion_smtp.login(remitente, password)

        # Objeto mensaje
        mensaje = MIMEMultipart()

        # Atributos del mensaje
        mensaje['From'] = remitente
        mensaje['To'] = destinatario
        mensaje['Subject'] = asunto
        mensaje['CC'] = int_to_str(BDowner_email)

        # Cuerpo del mensaje como objeto MIME de tipo texto
        mensaje.attach(MIMEText(cuerpo, 'plain'))

        # Objeto mensaje a texto
        texto = mensaje.as_string()

        # Envio del mensaje
        sesion_smtp.sendmail(remitente, destinatario, texto)

        # Cerrar conexión
        sesion_smtp.quit()

    except:
        print  ("Error en la conexion")
        raise e
        
    