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

    <!-- Tutorial 1 -->
    <div class="tarjeta-tutorial">
        <h2>Cómo editar tu perfil</h2>
        <div class="imagenes-tutorial">
            <img class="imagen-tutorial" src="${pageContext.request.contextPath}/vista/imagenes/crearunahistoria.png" alt="Paso 1">
            <img class="imagen-tutorial" src="${pageContext.request.contextPath}/vista/imagenes/tutorialesoriginal.png" alt="Paso 2">
        </div>
        <div class="contenido">
            <p>Autor: Admin</p>
            <div class="acciones">
                <button>Ver</button>
                <button>Guardar</button>
                <button>Compartir</button>
            </div>
        </div>
    </div>

    <!-- Tutorial 2 -->
    <div class="tarjeta-tutorial">
        <h2>Cómo subir una historia</h2>
        <div class="imagenes-tutorial">
            <img class="imagen-tutorial" src="${pageContext.request.contextPath}/vista/imagenes/subirunaHistoriatuto.png" alt="Paso 1">
            <img class="imagen-tutorial" src="${pageContext.request.contextPath}/vista/imagenes/Cargaunahistoria20.png" alt="Paso 2">
            <img class="imagen-tutorial" src="${pageContext.request.contextPath}/vista/imagenes/terceraparte.png" alt="Paso 3">
        </div>
        <div class="contenido">
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
    const imagenes = document.querySelectorAll('.imagen-tutorial');
    const modal = document.getElementById('modal-img');
    const modalImg = document.getElementById('imagen-ampliada');
    const cerrar = document.querySelector('.cerrar');
    let currentIndex = 0;

    // Abrir modal con la imagen clickeada
    imagenes.forEach((img, index) => {
        img.addEventListener('click', () => {
            currentIndex = index;
            modal.classList.add('open');
            modalImg.src = img.src;
        });
    });

    // Cerrar modal al hacer clic en la X
    cerrar.addEventListener('click', () => {
        modal.classList.remove('open');
    });

    // Cerrar modal al hacer clic fuera de la imagen
    modal.addEventListener('click', (e) => {
        if (e.target === modal) {
            modal.classList.remove('open');
        }
    });

    // Cambiar imagen con flechas del teclado
    document.addEventListener('keydown', (e) => {
        if (!modal.classList.contains('open')) return;

        if (e.key === 'ArrowRight') {
            currentIndex = (currentIndex + 1) % imagenes.length;
            modalImg.src = imagenes[currentIndex].src;
        } else if (e.key === 'ArrowLeft') {
            currentIndex = (currentIndex - 1 + imagenes.length) % imagenes.length;
            modalImg.src = imagenes[currentIndex].src;
        } else if (e.key === 'Escape') {
            modal.classList.remove('open');
        }
    });
</script>

</body>
</html>
