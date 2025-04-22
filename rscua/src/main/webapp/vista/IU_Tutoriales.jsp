<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>RSCUA - Tutoriales</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/TutorialesStyle.css">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="contenedor-tutoriales">
    <h1>Tutoriales Recomendados</h1>

    <div class="tarjeta-tutorial">
        <img class="imagen-ampliable" src="${pageContext.request.contextPath}/vista/img/Tutoriales.png" alt="Tutorial 1">
        <div class="contenido">
            <h2>Cómo editar tu perfil</h2>
            <p>Autor: Admin</p>
            <div class="acciones">
                <button>Ver</button>
                <button>Guardar</button>
                <button>Compartir</button>
            </div>
        </div>
    </div>

    <div class="tarjeta-tutorial">
        <img class="imagen-ampliable" src="${pageContext.request.contextPath}/vista/imagenes/tutorial2.jpg" alt="Tutorial 2">
        <div class="contenido">
            <h2>Cómo subir una historia</h2>
            <p>Autor: Moderador</p>
            <div class="acciones">
                <button>Ver</button>
                <button>Guardar</button>
                <button>Compartir</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal para imagen ampliada -->
<div id="modal-img" class="modal">
    <span class="cerrar">&times;</span>
    <img class="modal-contenido" id="imagen-ampliada">
</div>

<script>
    document.querySelectorAll('.imagen-ampliable').forEach(imagen => {
        imagen.addEventListener('click', function () {
            const modal = document.getElementById("modal-img");
            const imgModal = document.getElementById("imagen-ampliada");
            modal.style.display = "block";
            imgModal.src = this.src;
        });
    });

    document.querySelector(".cerrar").addEventListener('click', function () {
        document.getElementById("modal-img").style.display = "none";
    });

    window.addEventListener('click', function (e) {
        const modal = document.getElementById("modal-img");
        if (e.target === modal) {
            modal.style.display = "none";
        }
    });
</script>

</body>
</html>
