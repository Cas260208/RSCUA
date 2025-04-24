<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Historia</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/IU_VerHistoriasStyle.css">
</head>
<body>

<jsp:include page="header.jsp" />

<%
    String[] historias = {
            "Historia-1.jpeg", "Historia-2.jpeg", "Historia-3.jpeg", "Historia-4.jpeg", "Historia-5.jpeg",
            "Historia-6.jpeg", "Historia-7.jpeg", "Historia-8.jpeg", "Historia-9.jpeg", "Historia-10.jpeg",
            "Historia-11.jpeg", "Historia-12.jpeg", "Historia-13.jpeg"
    };

    int index = 0;
    try {
        index = Integer.parseInt(request.getParameter("index"));
    } catch (Exception e) { index = 0; }

    String historia = historias[index];
    String anterior = (index > 0) ? String.valueOf(index - 1) : null;
    String siguiente = (index < historias.length - 1) ? String.valueOf(index + 1) : null;

    String usuario = "Zaganav29"; // Cambiar por dinámico si se desea
    String fotoPerfil = "7772.jpg";
%>

<div class="story-container">
    <div class="story-header">
        <img src="${pageContext.request.contextPath}/vista/imagenes/<%= fotoPerfil %>" alt="Usuario">
        Historia de @<%= usuario %>
    </div>

    <div class="story-navigation">
        <% if (anterior != null) { %>
        <form action="IU_VerHistorias.jsp" method="get">
            <input type="hidden" name="index" value="<%= anterior %>">
            <button type="submit">&#10094;</button>
        </form>
        <% } %>

        <% if (siguiente != null) { %>
        <form action="IU_VerHistorias.jsp" method="get">
            <input type="hidden" name="index" value="<%= siguiente %>">
            <button type="submit">&#10095;</button>
        </form>
        <% } %>
    </div>

    <img class="story-image" src="${pageContext.request.contextPath}/vista/imagenes/<%= historia %>" alt="Historia actual">

    <div class="story-actions">
        <form method="post">
            <button class="like">&#10084;</button>
        </form>
    </div>

    <div class="comment-box">
        <form method="post">
            <input type="text" name="comentario" placeholder="Escribe un comentario...">
        </form>
    </div>
</div>

</body>
</html>
