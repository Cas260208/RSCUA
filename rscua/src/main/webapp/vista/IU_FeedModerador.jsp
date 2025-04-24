<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Moderador - Feed</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/FeedModeradorStyle.css">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="moderador-container">
  <h1>Panel de Gestión del Moderador</h1>

  <!-- Autenticación -->
  <section class="moderador-section">
    <h2>Gestor de Autenticación</h2>
    <button>Iniciar Sesión</button>
  </section>

  <!-- Mensajería -->
  <section class="moderador-section">
    <h2>Gestor de Mensajería</h2>
    <button>Recibir mensaje del Administrador</button>
    <button>Enviar mensaje al Administrador</button>
  </section>

  <!-- Publicaciones -->
  <section class="moderador-section">
    <h2>Gestor de Publicaciones</h2>
    <button>Enviar Reporte</button>
    <button>Eliminar Publicación</button>
    <button>Eliminar Comentario</button>
  </section>

  <!-- Eventos -->
  <section class="moderador-section">
    <h2>Gestor de Eventos</h2>
    <button>Enviar Reporte</button>
    <button>Eliminar Evento</button>
  </section>

  <!-- Perfil -->
  <section class="moderador-section">
    <h2>Gestor de Visualización de Perfil</h2>
    <button>Ver Foto de Perfil</button>
    <button>Ver Descripción</button>
    <button>Ver Publicaciones</button>
    <button>Ver Conexión</button>
    <button>Aplicar Filtros</button>
    <button>Reportar Perfil</button>
  </section>

  <!-- Reportes -->
  <section class="moderador-section">
    <h2>Gestor de Reportes</h2>
    <button>Reportar VidCor</button>
    <button>Reportar Historia</button>
    <button>Reportar Comentario</button>
    <button>Reportar Publicación</button>
    <button>Reportar Mensaje</button>
    <button>Seguimiento de Reporte</button>
  </section>

  <!-- Tendencias -->
  <section class="moderador-section">
    <h2>Gestor de Tendencias</h2>
    <button>Filtrar Tendencias</button>
    <button>Reportar Tendencia</button>
  </section>

  <!-- Historias -->
  <section class="moderador-section">
    <h2>Gestor de Historias</h2>
    <button>Eliminar Historia</button>
    <button>Reportar Historia</button>
    <button>Seguimiento de Reporte</button>
  </section>

  <!-- VidCor -->
  <section class="moderador-section">
    <h2>Gestor de VidCor</h2>
    <button>Reportar VidCor</button>
    <button>Eliminar VidCor</button>
    <button>Seguimiento de Reporte</button>
  </section>

  <!-- Feed -->
  <section class="moderador-section">
    <h2>Gestor de Feed</h2>
    <button>Visualizar Publicaciones</button>
    <button>Visualizar Sugerencias</button>
    <button>Visualizar Historias</button>
    <button>Visualizar Ayuda</button>
    <button>Visualizar Anuncios</button>
    <button>Visualizar VidCor</button>
    <button>Algoritmo de Creación de Feed</button>
  </section>

  <!-- Comunidad -->
  <section class="moderador-section">
    <h2>Gestor de Comunidad</h2>
    <button>Eliminar Comentario</button>
    <button>Reportar Comentario</button>
    <button>Eliminar Publicación</button>
    <button>Reportar Publicación</button>
    <button>Seguimiento de Reporte</button>
  </section>

  <!-- Notificaciones -->
  <section class="moderador-section">
    <h2>Gestor de Notificaciones</h2>
    <button>Respuesta del Administrador</button>
    <button>Seguimiento de Reportes</button>
  </section>
</div>

</body>
</html>