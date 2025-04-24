<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>IU_CrearVidcor</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/CrearVidcorStyle.css" />
</head>
<body>

<!-- Header global del sistema -->
<jsp:include page="header.jsp" />

<div class="editor-container">
    <h1>Editor de VidCor</h1>

    <!-- Vista previa del video -->
    <div class="video-preview">
        <video id="preview" controls></video>
        <div class="video-text-overlay" id="textOverlay"></div>
        <input type="file" accept="video/mp4" id="videoInput" />
    </div>

    <!-- Controles -->
    <div class="toolset">
        <h2>Herramientas de Edición</h2>

        <div class="control-group">
            <label for="filtro">Efectos y Filtros:</label>
            <select id="filtro">
                <option>Ninguno</option>
                <option>Blanco y negro</option>
                <option>Sepia</option>
                <option>Brillo</option>
            </select>
        </div>

        <div class="control-group">
            <label for="texto">Agregar Texto:</label>
            <input type="text" id="texto" placeholder="Texto a mostrar" />
        </div>

        <div class="control-group">
            <label for="audio">Agregar Audio:</label>
            <input type="file" accept="audio/mp3" id="audioInput" />
        </div>

        <div class="control-group">
            <label for="privacidad">Privacidad:</label>
            <select id="privacidad">
                <option>Público</option>
                <option>Privado</option>
                <option>Solo amigos</option>
            </select>
        </div>

        <div class="botones-accion">
            <button class="btn">Previsualizar</button>
            <button class="btn">Subir Video</button>
            <button class="btn">Compartir</button>
            <button class="btn">Reportar</button>
        </div>
    </div>
</div>

<script>
    const input = document.getElementById("videoInput");
    const preview = document.getElementById("preview");
    const filtro = document.getElementById("filtro");
    const textoInput = document.getElementById("texto");
    const textOverlay = document.getElementById("textOverlay");

    input.addEventListener("change", (e) => {
        const file = e.target.files[0];
        if (file) {
            preview.src = URL.createObjectURL(file);
            preview.load();
        }
    });

    filtro.addEventListener("change", () => {
        const value = filtro.value;
        switch (value) {
            case "Blanco y negro":
                preview.style.filter = "grayscale(100%)";
                break;
            case "Sepia":
                preview.style.filter = "sepia(80%)";
                break;
            case "Brillo":
                preview.style.filter = "brightness(1.3)";
                break;
            default:
                preview.style.filter = "none";
        }
    });

    textoInput.addEventListener("input", () => {
        textOverlay.innerText = textoInput.value;
    });
</script>

</body>
</html>
