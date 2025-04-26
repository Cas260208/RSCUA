<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ayuda</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/AyudaStyle.css">
</head>
<body>

<div class="barra">
    <jsp:include page="header.jsp"></jsp:include>
</div>

<div class="ayuda-container">
    <div class="ayuda-titulo">Asistencia y Ayuda</div>

    <div class="ayuda-secciones">
        <div class="ayuda-seccion" onclick="window.location.href='${pageContext.request.contextPath}/vista/IU_PreguntasGenerales.jsp'">
            <img src="${pageContext.request.contextPath}/vista/imagenes/informacion.jpg" alt="Preguntas">
            <p>Preguntas Generales</p>
        </div>

        <div class="ayuda-seccion" onclick="window.location.href='${pageContext.request.contextPath}/vista/IU_SegimientoDeReportes.jsp'">
            <img src="${pageContext.request.contextPath}/vista/imagenes/reportes.png" alt="Seguimiento de Reportes">
            <p>Seguimiento de Reportes</p>
        </div>


        <div class="ayuda-seccion" onclick="alert('Chat de Asistencia seleccionado')">
            <img src="${pageContext.request.contextPath}/vista/imagenes/chatasis.png" alt="Chat">
            <p>Chat de Asistencia</p>
        </div>

        <div class="ayuda-seccion" onclick="window.location.href='${pageContext.request.contextPath}/vista/IU_Tutoriales.jsp'">
            <img src="${pageContext.request.contextPath}/vista/imagenes/ayuda.jpg" alt="Tutoriales">
            <p>Tutoriales</p>
        </div>
    </div>

    <div class="ayuda-acerca-de">
        <h2>Acerca de Nosotros</h2>
        <p>Esta red social fue creada como parte del proyecto de la uea "Desarrollo a Gran Escala" impartida por el Profesor Pedro Pablo González Pérez.</p>
    </div>
</div>

</body>
</html>
