<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Buscar por Fecha</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/BuscarPorFechaStyle.css">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="buscar-fecha-container">
    <h2>Buscar eventos por fecha</h2>

    <form action="ControladorEventos" method="post">
        <div class="form-group">
            <label for="fecha">Selecciona una fecha:</label>
            <input type="date" id="fecha" name="fecha" required>
        </div>

        <div class="form-group">
            <button type="submit" name="accion" value="buscarPorFecha">Buscar</button>
        </div>
    </form>
</div>

</body>
</html>
