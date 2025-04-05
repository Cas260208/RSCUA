<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modulo.gestorAutenticacion.Usuario" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Publicación</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f3f3f3;
        }
        .post-container {
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
            width: 400px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }
        .header {
            padding: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .header img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }
        .header .username {
            font-weight: bold;
        }
        .options-menu {
            position: relative;
        }
        .options-button {
            background: none;
            border: none;
            cursor: pointer;
        }
        .options-button img {
            width: 24px;
            height: 24px;
        }
        .options-dropdown {
            display: none;
            position: absolute;
            top: 30px;
            right: 0;
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            z-index: 1000;
        }
        .options-dropdown ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }
        .options-dropdown ul li {
            padding: 10px;
            cursor: pointer;
            font-size: 12px;
        }
        .options-dropdown ul li:hover {
            background: #f3f3f3;
        }
        .options-menu:hover .options-dropdown {
            display: block;
        }
        .content {
            padding: 10px;
        }
        .content p {
            margin: 0 0 10px 0;
        }
        .images {
            display: flex;
            justify-content: space-around;
        }
        .images img {
            width: 30%;
            height: auto;
            border-radius: 10px;
        }
        .footer {
            display: flex;
            justify-content: space-around;
            padding: 10px;
            border-top: 1px solid #eee;
        }
        .footer button {
            background: none;
            border: none;
            cursor: pointer;
        }
        .footer img {
            width: 32px;
            height: 32px;
        }
    </style>
</head>
<body>
<div class="post-container">
    <%
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        String nombreCompleto = usuario.getNombre() + " " + usuario.getApellido();
        String username = usuario.getUsername();
    %>
    <div class="header">
        <div style="display: flex; align-items: center;">
            <img src="${pageContext.request.contextPath}/vista/imagenes/777.jpg" alt="Perfil">
            <span class="username">@<%= username %>></span>
        </div>
        <div class="options-menu">
            <button class="options-button">
                <img src="${pageContext.request.contextPath}/vista/imagenes/options.jpg" alt="Opciones">
            </button>
            <div class="options-dropdown">
                <ul>
                    <li>Reportar publicacion</li>
                    <li>Eliminar publicacion</li>
                    <li>Editar publicacion</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="content">
        <p>Un estilo diferente para el dia de hoy.</p>
        <div class="images">
            <img src="${pageContext.request.contextPath}/vista/imagenes/p1.jpg" alt="Imagen 1">
            <img src="${pageContext.request.contextPath}/vista/imagenes/p2.jpg" alt="Imagen 2">
        </div>
    </div>
    <div class="footer">
        <button><img src="${pageContext.request.contextPath}/vista/imagenes/like.jpg" alt="Like"></button>
        <button><img src="${pageContext.request.contextPath}/vista/imagenes/comentar.jpg" alt="Comment"></button>
        <button><img src="${pageContext.request.contextPath}/vista/imagenes/compartir.jpg" alt="Share"></button>
        <button><img src="${pageContext.request.contextPath}/vista/imagenes/guardar.jpg" alt="Save"></button>
    </div>
</div>
</body>
</html>
