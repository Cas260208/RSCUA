<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>VidCor - Explora</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/VidcorStyle.css">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="vidcor-fondo">

    <div class="vidcor-container">
        <h1>Explora VidCors</h1>

        <div class="btn-crear-container">
            <form action="${pageContext.request.contextPath}/vista/IU_CrearVidcor.jsp" method="get">
                <button type="submit" class="crear-btn">Crear Vidcor</button>
            </form>
        </div>

        <div class="vidcor-feed">
            <div class="vidcor-card">
                <video src="${pageContext.request.contextPath}/vista/videos/video 1.mp4" controls muted onclick="expandir(this)"></video>
            </div>
            <div class="vidcor-card">
                <video src="${pageContext.request.contextPath}/vista/videos/video 2.mp4" controls muted onclick="expandir(this)"></video>
            </div>
            <div class="vidcor-card">
                <video src="${pageContext.request.contextPath}/vista/videos/video 3.mp4" controls muted onclick="expandir(this)"></video>
            </div>
            <div class="vidcor-card">
                <video src="${pageContext.request.contextPath}/vista/videos/video 4.mp4" controls muted onclick="expandir(this)"></video>
            </div>
            <div class="vidcor-card">
                <video src="${pageContext.request.contextPath}/vista/videos/video 5.mp4" controls muted onclick="expandir(this)"></video>
            </div>
        </div>
    </div>
</div>

<!-- Modal para video expandido -->
<div class="modal-video" id="modalVideo" onclick="cerrarModal()">
    <video id="videoExpandido" controls autoplay></video>
</div>

<script>
    function expandir(video) {
        const modal = document.getElementById("modalVideo");
        const expanded = document.getElementById("videoExpandido");
        expanded.src = video.src;
        modal.style.display = "flex";
    }

    function cerrarModal() {
        const modal = document.getElementById("modalVideo");
        const expanded = document.getElementById("videoExpandido");
        expanded.pause();
        modal.style.display = "none";
        expanded.src = "";
    }
</script>

</body>
</html>

