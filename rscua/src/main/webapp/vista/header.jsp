<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="modulo.gestorConfiguracion.Configuracion" %>
<%
    Configuracion cfg = (Configuracion) session.getAttribute("configuracion");
    if (cfg == null) {
        cfg = new Configuracion();
    }
    boolean esOscuro = Boolean.TRUE.equals(session.getAttribute("esOscuro"));
%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/HeaderStyle.css">

<div class="barra">
    <form action="<c:url value='/ControladorPerfil'/>" method="post" style="display:inline;">
        <button type="submit" name="accion" value="perfil">
            <img src="${pageContext.request.contextPath}/vista/imagenes/7772.jpg" alt="Perfil">
        </button>
    </form>

    <form action="<c:url value='/ControladorFeed'/>" method="post" style="display:inline;">
        <button type="submit" name="accion" value="feed">
            <img src="${pageContext.request.contextPath}/vista/imagenes/inicio.jpg" alt="Feed">
        </button>
    </form>

    <form action="<c:url value='/ControladorNotificaciones'/>" method="post" style="display:inline;">
        <button type="submit" name="accion" value="notificaciones">
            <img src="${pageContext.request.contextPath}/vista/imagenes/notificaciones.png" alt="Notificaciones">
        </button>
    </form>

    <form action="<c:url value='/ControladorComunidades'/>" method="post" style="display:inline;">
        <button type="submit" name="accion" value="comunidades">
            <img src="${pageContext.request.contextPath}/vista/imagenes/comunidad.png" alt="Comunidades">
        </button>
    </form>

    <div class="busqueda">
        <form action="<c:url value='/ControladorBusqueda'/>" method="post" style="display: flex; align-items: center; width: 100%;">
            <input type="text" name="query" placeholder="Ingresa palabra clave">
            <button type="submit" name="accion" value="buscar">
                <img src="${pageContext.request.contextPath}/vista/imagenes/busqueda.jpg" alt="Buscar">
            </button>
        </form>
    </div>

    <form action="<c:url value='/ControladorMensajeria'/>" method="post" style="display:inline;">
        <button type="submit" name="accion" value="chats">
            <img src="${pageContext.request.contextPath}/vista/imagenes/chats.png" alt="Chats">
        </button>
    </form>

    <form action="<c:url value='/ControladorConfiguracion'/>" method="post" style="display:inline;">
        <button type="submit" name="accion" value="configuracion">
            <img src="${pageContext.request.contextPath}/vista/imagenes/configuracion.jpg" alt="Configuración">
        </button>
    </form>

    <form action="<c:url value='/ControladorAyuda'/>" method="post" style="display:inline;">
        <button type="submit" name="accion" value="ayuda">
            <img src="${pageContext.request.contextPath}/vista/imagenes/ayuda.jpg" alt="Ayuda">
        </button>
    </form>

    <form action="<c:url value='/ControladorCerrarSesion'/>" method="post" style="display:inline;">
        <button type="submit">
            <img src="${pageContext.request.contextPath}/vista/imagenes/salida.jpg" alt="Salir">
            <img src="${pageContext.request.contextPath}/vista/imagenes/pruebaL.jpg" alt="Logo" class="logo">
        </button>
    </form>
</div>

