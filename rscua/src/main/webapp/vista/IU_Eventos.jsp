<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Eventos</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/EvetosStyle.css">
</head>
<body>

<jsp:include page="header.jsp" />

<!-- Botones principales -->
<div class="botones-eventos">
  <a href="${pageContext.request.contextPath}/vista/IU_CrearEvento.jsp" class="boton-evento">
    <img src="${pageContext.request.contextPath}/vista/imagenes/Crearevento.jpg" alt="Crear Evento">
    <span>Crear Evento</span>
  </a>
  <a href="${pageContext.request.contextPath}/vista/IU_EventosCercanos.jsp" class="boton-evento">
    <img src="${pageContext.request.contextPath}/vista/imagenes/ubicacion.jpg" alt="Eventos cercanos">
    <span>Eventos cercanos</span>
  </a>

  <a href="${pageContext.request.contextPath}/vista/IU_BuscarporFecha.jsp" class="boton-evento">
    <img src="${pageContext.request.contextPath}/vista/imagenes/calendariodib.jpg" alt="Buscar por fecha">
    <span>Buscar por fecha</span>
  </a>

</div>

</body>
</html>
