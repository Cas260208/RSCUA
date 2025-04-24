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

<!-- Botones principales -->
<div class="botones">
    <button>
        <img src="${pageContext.request.contextPath}/vista/imagenes/sugerencias.png" alt="Sugerencias">
        Sugerencias
    </button>
    <button>
        <img src="${pageContext.request.contextPath}/vista/imagenes/tendencias.png" alt="Tendencias">
        Tendencias
    </button>
    <form action="${pageContext.request.contextPath}/vista/IU_Vidcor.jsp" method="get">
        <button type="submit">
            <img src="${pageContext.request.contextPath}/vista/imagenes/vidcor.png" alt="VidCor">
            VidCor
        </button>
    </form>
</div>

<!-- Sección de Historias -->
<div class="Historias">
    <div class="crear-historia">
        <form action="${pageContext.request.contextPath}/vista/IU_CrearHistoria.jsp" method="get">
            <button type="submit">Subir Nueva Historia</button>
        </form>
    </div>

    <div class="lista-historias">
        <ul>
            <li><a href="${pageContext.request.contextPath}/vista/IU_VerHistorias.jsp?index=0"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-1.jpeg" alt="Historia 1"></a></li>
            <li><a href="${pageContext.request.contextPath}/vista/IU_VerHistorias.jsp?index=1"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-2.jpeg" alt="Historia 2"></a></li>
            <li><a href="${pageContext.request.contextPath}/vista/IU_VerHistorias.jsp?index=2"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-3.jpeg" alt="Historia 3"></a></li>
            <li><a href="${pageContext.request.contextPath}/vista/IU_VerHistorias.jsp?index=3"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-4.jpeg" alt="Historia 4"></a></li>
            <li><a href="${pageContext.request.contextPath}/vista/IU_VerHistorias.jsp?index=4"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-5.jpeg" alt="Historia 5"></a></li>
            <li><a href="${pageContext.request.contextPath}/vista/IU_VerHistorias.jsp?index=5"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-6.jpeg" alt="Historia 6"></a></li>
            <li><a href="${pageContext.request.contextPath}/vista/IU_VerHistorias.jsp?index=6"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-7.jpeg" alt="Historia 7"></a></li>
            <li><a href="${pageContext.request.contextPath}/vista/IU_VerHistorias.jsp?index=7"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-8.jpeg" alt="Historia 8"></a></li>
            <li><a href="${pageContext.request.contextPath}/vista/IU_VerHistorias.jsp?index=8"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-9.jpeg" alt="Historia 9"></a></li>
            <li><a href="${pageContext.request.contextPath}/vista/IU_VerHistorias.jsp?index=9"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-10.jpeg" alt="Historia 10"></a></li>
            <li><a href="${pageContext.request.contextPath}/vista/IU_VerHistorias.jsp?index=10"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-11.jpeg" alt="Historia 11"></a></li>
            <li><a href="${pageContext.request.contextPath}/vista/IU_VerHistorias.jsp?index=11"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-12.jpeg" alt="Historia 12"></a></li>
            <li><a href="${pageContext.request.contextPath}/vista/IU_VerHistorias.jsp?index=12"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-13.jpeg" alt="Historia 13"></a></li>
        </ul>
    </div>
</div>

<!-- Publicaciones -->
<div class="IU_CrearPublicacion">
    <jsp:include page="IU_CrearPublicacion.jsp"/>
    <jsp:include page="IU_VerPublicacion.jsp" />
</div>

</body>
</html>
