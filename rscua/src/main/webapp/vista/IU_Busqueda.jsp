<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Búsqueda</title>
    <link rel="stylesheet" href="vista/css/BusquedaStyle.css">
</head>
<body>
<div class="barra">
    <jsp:include page="header.jsp"></jsp:include>
</div>

<div class="buttons">
    <div class="dropdown">
        <button class="dropbtn">
            <img src="<%= request.getContextPath() %>/vista/imagenes/filtro.png" alt="Filtro">
            Filtro de búsqueda
        </button>
        <div class="dropdown-content">
            <a href="#">📄 Publicaciones</a>
            <a href="#">👤 Perfil</a>
            <a href="#">🎬 VidCor</a>
        </div>
    </div>

    <button>
        <img src="<%= request.getContextPath() %>/vista/imagenes/historial.png" alt="Historial">
        Historial de Búsqueda
    </button>
    <c:if test="${not empty historial}">
        <div class="historial-box">
            <h2>Historial de Búsqueda</h2>
            <ul>
                <c:forEach var="item" items="${historial}">
                    <li>${item}</li>
                </c:forEach>
            </ul>
        </div>
    </c:if>
</div>


<div class="resultados">
    <h1>Búsquedas relacionadas con: CasZer29</h1>
    <div class="perfil-item">
        <img src="${pageContext.request.contextPath}/vista/imagenes/cas.jpg" alt="Perfil">
        <div class="perfil-info">
            <h2>Casandra Zetina</h2>
            <p>@CasZer29</p>
        </div>
        <div class="acciones">
            <button>Seguir</button>
            <button>Bloquear</button>
        </div>
    </div>
    <div class="descripcion-post">Un día fantástico.</div>
    <div class="publicaciones">
        <img src="${pageContext.request.contextPath}/vista/imagenes/p1.jpg" alt="Post 1">
        <img src="${pageContext.request.contextPath}/vista/imagenes/p2.jpg" alt="Post 2">
    </div>
</div>
<!-- Modal de Historial -->
<div id="modalHistorial" class="modal">
    <div class="modal-content">
        <span class="cerrar">&times;</span>
        <h2>Historial de Búsqueda</h2>
        <ul>
            <li>Publicaciones sobre gatos</li>
            <li>Perfil de Ana</li>
            <li>VidCor de cocina</li>
        </ul>
    </div>
</div>

<!-- Script para mostrar y cerrar el modal -->
<script>
    const btnHistorial = document.querySelector("button:has(img[alt='Historial'])");
    const modal = document.getElementById("modalHistorial");
    const cerrar = document.querySelector(".cerrar");

    if (btnHistorial && modal && cerrar) {
        btnHistorial.addEventListener("click", (e) => {
            e.preventDefault();
            modal.style.display = "flex";
        });

        cerrar.onclick = function () {
            modal.style.display = "none";
        }

        window.onclick = function (event) {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        }
    }
</script>

</body>


</html>
