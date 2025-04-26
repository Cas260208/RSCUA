<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Seguimiento de Reportes</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/SegimientoDeReportes.css">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="contenedor-reportes">
    <h1>Seguimiento de Reportes</h1>

    <div class="tabla-reportes">
        <div class="reporte encabezado">
            <span>ID</span>
            <span>Fecha</span>
            <span>Estado</span>
            <span>Descripción</span>
        </div>

        <div class="reporte">
            <span>#001</span>
            <span>20/04/2025</span>
            <span class="estado pendiente">Pendiente</span>
            <span>No carga el perfil de usuario</span>
        </div>

        <div class="reporte">
            <span>#002</span>
            <span>21/04/2025</span>
            <span class="estado resuelto">Resuelto</span>
            <span>Problema de inicio de sesión solucionado</span>
        </div>

        <div class="reporte">
            <span>#003</span>
            <span>22/04/2025</span>
            <span class="estado en-proceso">En proceso</span>
            <span>Error al subir publicaciones con video</span>
        </div>
    </div>
</div>

</body>
</html>
