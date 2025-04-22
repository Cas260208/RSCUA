<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Eventos Cercanos</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/EventosCercanosStyle.css">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="eventos-cercanos-container">
  <h2>Eventos Cercanos</h2>

  <div class="tarjetas-eventos">
    <!-- Tarjeta de evento -->
    <div class="tarjeta-evento">
      <img src="${pageContext.request.contextPath}/vista/imagenes/evento1.jpg" alt="Evento 1">
      <h3>Festival de Música</h3>
      <p><strong>Ubicación:</strong> Parque Central</p>
      <p><strong>Fecha:</strong> 25 abril 2025</p>
      <button>Ver más</button>
    </div>

    <!-- Otro evento -->
    <div class="tarjeta-evento">
      <img src="${pageContext.request.contextPath}/vista/imagenes/evento2.jpg" alt="Evento 2">
      <h3>Expo Arte</h3>
      <p><strong>Ubicación:</strong> Museo Cuajimalpa</p>
      <p><strong>Fecha:</strong> 28 abril 2025</p>
      <button>Ver más</button>
    </div>

    <!-- Evento 3 -->
    <div class="tarjeta-evento">
      <img src="${pageContext.request.contextPath}/vista/imagenes/evento3.jpg" alt="Evento 3">
      <h3>Charla de Tecnología</h3>
      <p><strong>Ubicación:</strong> Auditorio UAM</p>
      <p><strong>Fecha:</strong> 30 abril 2025</p>
      <button>Ver más</button>
    </div>
  </div>
</div>

</body>
</html>
