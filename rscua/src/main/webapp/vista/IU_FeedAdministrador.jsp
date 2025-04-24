<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Administrador - Feed</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/FeedAdminStyle.css">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="admin-container">
    <h1>Panel de Gestión del Administrador</h1>

    <section class="admin-section">
        <h2>Gestor de Autenticación</h2>
        <div class="admin-actions">
            <button>Banear Perfil</button>
            <button>Eliminar Perfil</button>
        </div>
    </section>

    <section class="admin-section">
        <h2>Gestor de Publicaciones</h2>
        <div class="admin-actions">
            <button>Eliminar Publicación</button>
            <input type="text" placeholder="Motivo de eliminación">
            <button>Eliminar Comentario</button>
        </div>
    </section>

    <section class="admin-section">
        <h2>Gestor de Feed</h2>
        <div class="admin-actions">
            <button>Visualizar Publicaciones</button>
            <button>Visualizar Reportes</button>
            <button>Visualizar Moderadores</button>
        </div>
    </section>

    <section class="admin-section">
        <h2>Gestor de Notificaciones</h2>
        <div class="admin-actions">
            <button>Enviar Aviso de Reporte</button>
            <button>Mensaje de Moderador</button>
        </div>
    </section>

    <section class="admin-section">
        <h2>Gestor de Eventos</h2>
        <div class="admin-actions">
            <button>Eliminar Evento</button>
            <input type="text" placeholder="Motivo de eliminación">
        </div>
    </section>

    <section class="admin-section">
        <h2>Gestor de VidCor</h2>
        <div class="admin-actions">
            <button>Eliminar VidCor</button>
            <input type="text" placeholder="Motivo de eliminación">
        </div>
    </section>

    <section class="admin-section">
        <h2>Gestor de Mensajería</h2>
        <div class="admin-actions">
            <button>Recibir mensaje de moderador</button>
            <button>Enviar mensaje</button>
        </div>
    </section>

    <section class="admin-section">
        <h2>Gestor de Tendencias</h2>
        <div class="admin-actions">
            <button>Cambiar Filtro</button>
            <button>Eliminar Tendencia</button>
        </div>
    </section>

    <section class="admin-section">
        <h2>Gestor de Visualización de Perfil</h2>
        <div class="admin-actions">
            <button>Ver Foto de Perfil</button>
            <button>Ver Descripción</button>
            <button>Ver Publicaciones</button>
            <button>Ver Conexión</button>
            <button>Aplicar Filtros</button>
        </div>
    </section>

    <section class="admin-section">
        <h2>Gestor de Reportes</h2>
        <div class="admin-actions">
            <button>Visualizar Reportes</button>
            <button>Aceptar Reporte</button>
            <button>Rechazar Reporte</button>
            <button>Revisión Automática</button>
        </div>
    </section>

    <section class="admin-section">
        <h2>Gestor de Comunidad</h2>
        <div class="admin-actions">
            <button>Eliminar Publicación de Comunidad</button>
            <input type="text" placeholder="Motivo de eliminación">
        </div>
    </section>

    <section class="admin-section">
        <h2>Gestor de Historias</h2>
        <div class="admin-actions">
            <button>Eliminar Historia</button>
            <button>Revisar Reporte de Comunidad</button>
        </div>
    </section>
</div>

</body>
</html>
