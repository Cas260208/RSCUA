<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Historia Perfil</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/IU_HistoriasPerfilStyle.css">
</head>
<body>

<jsp:include page="header.jsp" />

<%
    String[] historiasPerfil = {
            "perfil_1.jpg", "perfil_2.jpg", "perfil_3.jpg", "perfil_4.jpg",
            "perfil_5.jpg", "perfil_6.jpg", "perfil_7.jpg", "perfil_8.jpg"
    };

    int index = 0;
    try {
        index = Integer.parseInt(request.getParameter("index"));
    } catch (Exception e) {
        index = 0;
    }

    String historia = historiasPerfil[index];
    String anterior = (index > 0) ? String.valueOf(index - 1) : null;
    String siguiente = (index < historiasPerfil.length - 1) ? String.valueOf(index + 1) : null;

    String usuario = "Zaganav29";
    String fotoPerfil = "7772.jpg";
%>

<div class="story-container">
    <div class="story-header">
        <img src="${pageContext.request.contextPath}/vista/imagenes/<%= fotoPerfil %>" alt="Usuario">
        Historia de @<%= usuario %>
    </div>

    <div class="story-navigation">
        <% if (anterior != null) { %>
        <form action="IU_HistoriasPerfil.jsp" method="get">
            <input type="hidden" name="index" value="<%= anterior %>">
            <button type="submit">&#10094;</button>
        </form>
        <% } %>

        <% if (siguiente != null) { %>
        <form action="IU_HistoriasPerfil.jsp" method="get">
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
