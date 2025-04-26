<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Crear Evento</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/CrearEventoStyle.css">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="form-container">
    <h2>Crear evento</h2>
    <%--
        <form action="#" method="post" enctype="multipart/form-data">
        <form action="${pageContext.request.contextPath}/ControladorEventos" method="post" enctype="multipart/form-data">
        Se comentarón estás dos lineas FUNCIONALES para hacer pruebas
        --%>
    <form action="${pageContext.request.contextPath}/ControladorEventos" method="post" enctype="multipart/form-data">
        <input type="hidden" name="accion" value="crearEvento" />

        <div class="form-group">
            <label for="titulo">Título del evento</label>
            <input type="text" id="titulo" name="titulo" placeholder="Nombre del evento..." required />
        </div>

        <div class="form-group">
            <label for="fecha">Fecha</label>
            <input type="date" id="fecha" name="fecha" required />
        </div>

        <div class="form-group">
            <label for="ubicacion">Ubicación</label>
            <input type="text" id="ubicacion" name="ubicacion" placeholder="Ciudad, país..." required />
        </div>

        <div class="form-group">
            <label for="tipo">Tipo de evento</label>
            <select id="tipo" name="tipo" required>
                <option value="" disabled selected>Seleccione el tipo de evento</option>
                <option value="Singular">Singular</option>
                <option value="Grupal">Grupal</option>
                <option value="Masivo">Masivo</option>
                <option value="social">Privado</option>

            </select>
        </div>

        <div class="form-group">
            <label for="categoria">Categoría de evento</label>
            <select id="categoria" name="categoria" required>
                <option value="" disabled selected>Seleccione una categoría</option>
                <option value="tecnologia">Tecnología</option>
                <option value="educacion">Educación</option>
                <option value="arte">Arte</option>
                <option value="deportes">Deportes</option>
                <option value="otros">Otros</option>
            </select>
        </div>

        <div class="form-group">
            <label for="descripcion">Descripción (opcional)</label>
            <textarea id="descripcion" name="descripcion" placeholder="Agrega una breve descripción..."></textarea>
        </div>

        <div class="form-group">
            <label for="media">Subir imagen o video</label>
            <input type="file" id="media" name="media" accept="image/,video/" style="display: none;" />
            <label for="media" class="btn-file">Seleccionar archivo</label>
        </div>

        <div class="form-group">
            <button type="submit" class="btn-submit">Crear evento</button>
        </div>
    </form>
</div>
</body>
</html>