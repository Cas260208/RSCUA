# RSCUA - Proyecto Aplicación Web MVC

Este repositorio contiene el proyecto **RSCUA**, una aplicación web desarrollada en **Java** utilizando el patrón arquitectónico **MVC** de 4 capas. A continuación, se presentan las instrucciones para configurar y ejecutar el proyecto localmente.

## Tabla de Contenidos
- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Configuración](#configuración)
- [Ejecución del Proyecto](#ejecución-del-proyecto)
- [Equipo de Desarrollo](#equipo-de-desarrollo)
- [Enlaces Útiles](#enlaces-útiles)

## Requisitos
Antes de comenzar, asegúrate de tener instaladas las siguientes herramientas:

- **Java SDK 20**
- **IntelliJ IDEA Ultimate Edition 2024** ([Obtén una licencia gratuita como estudiante aquí](https://www.jetbrains.com/shop/eform/students))
- **Apache Tomcat 9.0.98**
- **MySQL Community Edition** (incluye MySQL Workbench y MySQL Shell)
- **Conector MySQL para Java**


## Instalación

### Clonar el Repositorio
Clona este repositorio desde GitHub:
```bash
git clone https://github.com/Cas260208/RSCUA.git
O descarga el proyecto como un archivo ZIP y descomprímelo.
```` 
Abre el proyecto en IntelliJ IDEA Ultimate Edition.

**Crear la Base de Datos**  
Instala y configura MySQL Community Edition.  
Usa la contraseña predeterminada `rHQKUcA3XE` para garantizar la conexión con el proyecto.  
Importa la base de datos siguiendo este tutorial en YouTube (enlace).

### Configuración  
**Configurar IntelliJ IDEA**  
Verifica la estructura del proyecto en **Project Structure**:  
- Módulos  
- Facets  
- Artifacts  
Configura un nuevo servidor local:  
- Ve a `Run > Edit Configurations`.  
- Añade una configuración para **Tomcat Server > Local**.  
- En **Deployment**, selecciona `rscua:war exploded`.

**Conectar la Base de Datos**  
Agrega el **Data Source**:  
- Tipo: **MySQL**  
- Usuario: `root`  
- Contraseña: `rHQKUcA3XE`  
Prueba la conexión y aplica los cambios.

### Ejecución del Proyecto 
En IntelliJ IDEA, selecciona el servidor configurado.  
Haz clic en **Run** para iniciar el servidor.  
Accede a la aplicación desde tu navegador en `http://localhost:8080`.

### Equipo de Desarrollo
- Casandra Zetina Rodriguez  
- Iván Garrido Velázquez  
- Miguel Ángel Jimenez Salazar  
- Santiago Camarena Torres
- Alan David Benitez Garcia
- Mario Ortiz Garcia
- Kevin Dominguez Alavez

### Enlaces Útiles
- [Repositorio en GitHub](https://github.com/Cas260208/RSCUA/tree/main )  
- [Java SDK 20](https://www.oracle.com/java/technologies/javase/jdk20-archive-downloads.html)  
- [Apache Tomcat 9.0.98](https://tomcat.apache.org/download-90.cgi)  
- [MySQL Community Edition](https://dev.mysql.com/downloads/workbench/)  
- [Conector MySQL](https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.3.0/)
