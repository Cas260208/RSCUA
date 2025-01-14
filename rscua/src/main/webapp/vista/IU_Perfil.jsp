<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Perfil</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: ${esOscuro ? '#121212' : 'white'};
            color: ${esOscuro ? 'white' : 'black'};
            margin: 0;
            padding: 0;
        }
        .barra {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 40px;
            background-color: ${esOscuro ? '#1e1e1e' : 'white'};
            border-bottom: 1px solid ${esOscuro ? '#333' : 'black'};
            border-radius: 10px;
        }

        .barra img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-color: transparent;
            padding: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
            transition: transform 0.3s ease;
        }

        .barra img:hover {
            transform: scale(1.1);
        }

        .barra button {
            background-color: transparent;
            border: none;
            padding: 0;
            display: inline-flex;
            align-items: center;
            cursor: pointer;
        }

        .busqueda {
            display: flex;
            align-items: center;
            justify-content: space-between;
            border: 1px solid ${esOscuro ? '#444' : 'black'};
            border-radius: 15px;
            padding: 5px 10px;
            background-color: ${esOscuro ? '#333' : 'white'};
            width: 600px;
        }

        .busqueda input {
            border: none;
            outline: none;
            flex-grow: 1;
            padding: 5px;
            font-size: 16px;
            background-color: transparent;
            color: inherit;
        }

        .busqueda button img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }
        /* Foto de perfil e información principal */

        /* Foto de perfil e información principal */

        .perfil-header {
            text-align: center;
            padding: 20px;
            background-color: black;
            color: white;
        }

        .perfil-header img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .perfil-header img:hover {
            transform: scale(1.1);
        }

        .perfil-header h1 {
            margin: 10px 0 5px;
            font-size: 24px;
        }

        .perfil-header p {
            font-size: 16px;
            color: gray;
        }

        .informacion {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px auto;
            gap: 30px;
            padding: 10px;
            flex-wrap: wrap;
            font-size: 14px;
            text-align: center;
        }

        .informacion div {
            display: flex;
            align-items: center;
            gap: 5px;
            cursor: pointer;
        }

        .informacion div img {
            width: 20px;
            height: 20px;
        }

        .historias-container {
            margin: 20px auto;
            padding: 10px;
            max-width: 900px;
            display: flex;
            overflow-x: auto;
            gap: 15px;
            scrollbar-width: none; /* Firefox */
            -ms-overflow-style: none; /* Internet Explorer 10+ */
        }

        .historias-container::-webkit-scrollbar {
            display: none; /* Chrome, Safari, Edge */
        }

        .historia {
            flex-shrink: 0;
            width: 120px;
            height: 150px;
            border-radius: 15px;
            position: relative;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .historia img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 15px;
            border: 3px solid ${esOscuro ? '#444' : '#ddd'};
        }

        .historia:hover {
            transform: scale(1.1);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .crear-historia {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-shrink: 0;
            width: 120px;
            height: 150px;
            background-color: ${esOscuro ? '#333' : '#f0f0f0'};
            border: 2px dashed ${esOscuro ? '#555' : '#ccc'};
            border-radius: 15px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .crear-historia:hover {
            background-color: ${esOscuro ? '#444' : '#ddd'};
            transform: scale(1.05);
        }

        .crear-historia p {
            font-size: 14px;
            color: ${esOscuro ? '#bbb' : '#666'};
        }

        .publicacion {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid ${esOscuro ? '#444' : '#ccc'};
            border-radius: 15px;
            background-color: ${esOscuro ? '#1e1e1e' : 'white'};
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .publicacion-header {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .publicacion-header img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }

        .publicacion-header div h3 {
            margin: 0;
        }

        .publicacion-body img {
            width: 100%;
            margin: 10px 0;
            border-radius: 10px;
            cursor: pointer;
            transition: transform 0.3s ease, opacity 0.3s ease;
        }

        .publicacion-body img:hover {
            transform: scale(1.02);
            opacity: 0.9;
        }

        .publicacion-footer {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }

        .publicacion-footer button {
            background-color: transparent;
            border: none;
            cursor: pointer;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 5px;
            transition: transform 0.3s ease, color 0.3s ease;
        }

        .publicacion-footer button:hover {
            transform: scale(1.1);
            color: ${esOscuro ? '#fff' : 'black'};
        }

        .publicacion-footer button img {
            width: 20px;
            height: 20px;
        }
    </style>
</head>
<body>

<div class="barra">
    <form action="ControladorPerfil" method="post" style="display:inline;">
        <button type="submit" name="accion" value="perfil">
            <img src="${pageContext.request.contextPath}/vista/imagenes/7772.jpg" alt="Perfil">
        </button>
    </form>

    <form action="ControladorFeed" method="post" style="display:inline;">
        <button type="submit" name="accion" value="feed">
            <img src="${pageContext.request.contextPath}/vista/imagenes/inicio.jpg" alt="Feed">
        </button>
    </form>

    <form action="ControladorNotificaciones" method="post" style="display:inline;">
        <button type="submit" name="accion" value="notificaciones">
            <img src="${pageContext.request.contextPath}/vista/imagenes/notificaciones.png" alt="Notificaciones">
        </button>
    </form>

    <form action="ControladorComunidades" method="post" style="display:inline;">
        <button type="submit" name="accion" value="comunidades">
            <img src="${pageContext.request.contextPath}/vista/imagenes/comunidad.png" alt="Comunidades">
        </button>
    </form>

    <div class="busqueda">
        <form action="ControladorBusqueda" method="post" style="display: flex; align-items: center; width: 100%;">
            <input type="text" name="query" placeholder="Ingresa palabra clave">
            <button type="submit" name="accion" value="buscar">
                <img src="${pageContext.request.contextPath}/vista/imagenes/busqueda.jpg" alt="Buscar">
            </button>
        </form>
    </div>

    <form action="ControladorBusqueda" method="post" style="display:inline;">
        <button type="submit" name="accion" value="chats">
            <img src="${pageContext.request.contextPath}/vista/imagenes/chats.png" alt="Chats">
        </button>
    </form>

    <form action="ControladorBusqueda" method="post" style="display:inline;">
        <button type="submit" name="accion" value="configuracion">
            <img src="${pageContext.request.contextPath}/vista/imagenes/configuracion.jpg" alt="Configuración">
        </button>
    </form>

    <button>
        <img src="${pageContext.request.contextPath}/vista/imagenes/salida.jpg" alt="Salir">
    </button>

    <!-- Logo -->
    <img src="${pageContext.request.contextPath}/vista/imagenes/pruebaL.jpg" alt="Logo">
</div>

<div class="perfil-header">
    <img src="${pageContext.request.contextPath}/vista/imagenes/7772.jpg" alt="Foto de Perfil" onclick="alert('Foto de perfil seleccionada')">
    <h1>Iván Garrido Velázquez</h1>
    <p>@Ivan</p>
</div>

<div class="informacion">
    <div onclick="alert('Estudia en UAM Cuajimalpa')">
        <img src="${pageContext.request.contextPath}/vista/imagenes/escuela.jpg" alt="Escuela">
        <span>Estudia en 'UAM Cuajimalpa'</span>
    </div>
    <div onclick="alert('Relación')">
        <img src="${pageContext.request.contextPath}/vista/imagenes/relacion.jpg" alt="Relación">
        <span>En una relación con 'CasZrd'</span>
    </div>
    <div onclick="alert('Ubicación')">
        <img src="${pageContext.request.contextPath}/vista/imagenes/ubicacion.jpg" alt="Ubicación">
        <span>Vive en CDMX</span>
    </div>
    <div onclick="alert('Escuchando música')">
        <img src="${pageContext.request.contextPath}/vista/imagenes/musica.jpg" alt="Música">
        <span>Escuchando: 'Confieso - Kanye García West'</span>
    </div>
</div>

<div class="historias-container">
    <div class="crear-historia" onclick="alert('Subir nueva historia')">
        <p>+ Crear Historia</p>
    </div>
    <div class="historia" onclick="alert('Historia seleccionada')">
        <img src="${pageContext.request.contextPath}/vista/imagenes/Historia-1.jpeg" alt="Historia 1">
    </div>
    <div class="historia" onclick="alert('Historia seleccionada')">
        <img src="${pageContext.request.contextPath}/vista/imagenes/Historia-2.jpeg" alt="Historia 2">
    </div>
    <div class="historia" onclick="alert('Historia seleccionada')">
        <img src="${pageContext.request.contextPath}/vista/imagenes/Historia-3.jpeg" alt="Historia 3">
    </div>
    <div class="historia" onclick="alert('Historia seleccionada')">
        <img src="${pageContext.request.contextPath}/vista/imagenes/Historia-4.jpeg" alt="Historia 4">
    </div>
</div>


<div class="publicacion">
    <div class="publicacion-header">
        <img src="${pageContext.request.contextPath}/vista/imagenes/7772.jpg" alt="Foto de Perfil">
        <div>
            <h3>Iván Garrido Velázquez</h3>
            <p style="color: gray;">@Ivan</p>
        </div>
    </div>
    <div class="publicacion-body">
        <p>Un look diferente para el día de hoy</p>
        <img src="${pageContext.request.contextPath}/vista/imagenes/publicacionIvan.jpg" alt="Publicación" onclick="alert('Imagen seleccionada')">
    </div>
    <div class="publicacion-footer">
        <button onclick="alert('Me gusta')">
            <img src="${pageContext.request.contextPath}/vista/imagenes/like.jpg" alt="Me gusta"> Me gusta
        </button>
        <button onclick="alert('Comentar')">
            <img src="${pageContext.request.contextPath}/vista/imagenes/comentar.jpg" alt="Comentar"> Comentar
        </button>
        <button onclick="alert('Compartir')">
            <img src="${pageContext.request.contextPath}/vista/imagenes/compartir.jpg" alt="Compartir"> Compartir
        </button>
        <button onclick="alert('Guardar')">
            <img src="${pageContext.request.contextPath}/vista/imagenes/guardar.jpg" alt="Guardar"> Guardar
        </button>
    </div>
</div>


</body>
</html>

