<%@ page import="modulo.gestorAutenticacion.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>RSCUA</title>
    <link rel="stylesheet" href="vista/css/FeedStyle.css">
</head>
<body>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
%>
<!-- Barra de navegación -->
<div class="barra">
    <jsp:include page="header.jsp"></jsp:include>
</div>

<!-- Zona de publicaciones -->
<div class="IU_CrearPublicacion">
    <jsp:include page="IU_CrearPublicacion.jsp"></jsp:include>
    <jsp:include page="IU_VerPublicacion.jsp"></jsp:include>
</div>

</body>
</html>
