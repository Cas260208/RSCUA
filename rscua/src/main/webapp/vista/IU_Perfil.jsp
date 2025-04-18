<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modulo.gestorAutenticacion.Usuario" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Perfil</title>
    <link rel="stylesheet" href="vista/css/PerfilStyle.css">
</head>
<body>

<div class="barra">
    <jsp:include page="header.jsp"></jsp:include>
</div>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    String nombreCompleto = usuario.getNombre() + " " + usuario.getApellido();
    String username = usuario.getUsername();
%>

<div class="perfil-header">
    <img src="${pageContext.request.contextPath}/vista/imagenes/7772.jpg" alt="Foto de Perfil" onclick="alert('Foto de perfil seleccionada')">
    <h1><%= nombreCompleto %></h1>
    <p>@<%= username %></p>
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
    <div onclick="alert('Elementos guardados')">
        <img src="${pageContext.request.contextPath}/vista/imagenes/guardar.jpg" alt="Guardar">

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
            <h3><%= nombreCompleto%>></h3>
            <p style="color: gray;">@<%= username%></p>
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

