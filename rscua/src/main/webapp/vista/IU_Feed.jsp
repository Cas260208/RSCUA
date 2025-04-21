<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modulo.gestorAutenticacion.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>RSCUA - Feed</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/FeedStyle.css">
</head>
<body>
<jsp:include page="header.jsp" />

<div class="botones">
    <button>
        <img src="${pageContext.request.contextPath}/vista/imagenes/sugerencias.png" alt="Sugerencias">
        Sugerencias
    </button>
    <button>
        <img src="${pageContext.request.contextPath}/vista/imagenes/tendencias.png" alt="Tendencias">
        Tendencias
    </button>
    <button>
        <img src="${pageContext.request.contextPath}/vista/imagenes/vidcor.png" alt="VidCor">
        VidCor
    </button>
</div>

<div class="Historias">
    <div class="crear-historia">
        <form action="${pageContext.request.contextPath}/vista/IU_CrearHistoria.jsp" method="get">
            <button type="submit">Subir Nueva Historia</button>
        </form>
    </div>
    <div class="lista-historias">
        <ul>
            <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-1.jpeg"></li>
            <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-2.jpeg"></li>
            <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-3.jpeg"></li>
            <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-4.jpeg"></li>
            <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-5.jpeg"></li>
            <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-6.jpeg"></li>
            <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-7.jpeg"></li>
            <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-8.jpeg"></li>
            <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-9.jpeg"></li>
            <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-10.jpeg"></li>
            <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-11.jpeg"></li>
            <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-12.jpeg"></li>
            <li><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-13.jpeg"></li>
        </ul>
    </div>
</div>


<div class="IU_CrearPublicacion">
    <jsp:include page="IU_CrearPublicacion.jsp"/>
    <jsp:include page="IU_VerPublicacion.jsp" />
</div>
</body>
</html>
