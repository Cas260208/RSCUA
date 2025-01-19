<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>RSCUA</title>
    <link rel="stylesheet" href="vista/css/FeedStyle.css">
</head>
<body>
<div class="barra">
    <jsp:include page="header.jsp"></jsp:include>
</div>

    <div class="Historias">
        <div class="crear-historia">
            <form action="ControladorHistorias" method="get">
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

    <div class="home">
    </div>

    <div class="IU_CrearPublicacion">
        <jsp:include page="IU_CrearPublicacion.jsp"></jsp:include>
        <jsp:include page="IU_Publicacion.jsp"></jsp:include>
    </div>
</body>
</html>
