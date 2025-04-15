<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Eventos</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/estiloEventos.css">
</head>
<body>

<jsp:include page="header.jsp" />

<!-- Acciones arriba de eventos -->
<div class="acciones-evento">
  <div class="action">
    <span>Eventos cercanos</span>
    <a href="https://www.google.com" target="_blank">
      <img src="${pageContext.request.contextPath}/vista/imagenes/ubicacion.jpg" alt="Ubicación">
    </a>
  </div>
  <div class="action">
    <span>Buscar por fecha</span>
    <a href="https://www.google.com" target="_blank">
      <img src="${pageContext.request.contextPath}/vista/img/calendario2.webp" alt="Calendario">
    </a>
  </div>
</div>

<!-- Cuadrícula de eventos -->
<div class="contenedor-eventos">
  <div class="evento">
    <p>Musicales</p>
    <a href="https://www.google.com" target="_blank">
      <img src="${pageContext.request.contextPath}/vista/img/musica.jpg" alt="Musicales">
    </a>
  </div>
  <div class="evento">
    <p>Deportivos</p>
    <a href="https://www.google.com" target="_blank">
      <img src="${pageContext.request.contextPath}/vista/img/dep.jpg" alt="Deportivos">
    </a>
  </div>
  <div class="evento">
    <p>Culturales</p>
    <a href="https://www.google.com" target="_blank">
      <img src="${pageContext.request.contextPath}/vista/imagenes/cultural.jpg" alt="Culturales">
    </a>
  </div>
  <div class="evento">
    <p>Entretenimiento</p>
    <a href="https://www.google.com" target="_blank">
      <img src="${pageContext.request.contextPath}/vista/img/entretenimiento.jpg" alt="Entretenimiento">
    </a>
  </div>
</div>

</body>
</html>
