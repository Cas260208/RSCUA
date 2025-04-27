<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Crear Historia</title>
  <link rel="stylesheet" href="css/crearHistoriaStyle.css">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="form-container">
  <h2>Crear historia</h2>
<!-- con la siguiente linea se mandan las peticiones de info al controlador -->
  <form action="<c:url value='/ControladorHistorias'/>"
        method="post"
        enctype="multipart/form-data">

    <!-- Campo para contenido -->
    <label for="descripcion">Descripción (opcional)</label>
    <textarea id="descripcion" name="descripcion" placeholder="¿Qué deseas compartir hoy?"></textarea>

    <!-- Subir imagen -->
    <label for="imagen">Subir Imagen (JPG, JPEG o PNG):</label>
    <input type="file" name="imagen" id="imagen" accept="image/jpeg, image/jpg, image/png">

    <div id="preview-container" style="margin-top:10px; display: none;">
      <p>Vista previa:</p>
      <img id="preview" src="" alt="Vista previa de imagen" style="max-width: 100%; border-radius: 8px;">
    </div>

    <div class="botones">
      <button type="submit" >Publicar </button>
    </div>
  </form>
</div>

<script>
  document.addEventListener("DOMContentLoaded", () => {
    const imagenInput = document.getElementById('imagen');
    const previewContainer = document.getElementById('preview-container');
    const preview = document.getElementById('preview');

    imagenInput.addEventListener('change', function () {
      const file = imagenInput.files[0];
      if (file) {
        const allowedExtensions = ['image/jpeg', 'image/jpg', 'image/png'];
        if (allowedExtensions.includes(file.type)) {
          const reader = new FileReader();
          reader.onload = function (e) {
            preview.src = e.target.result;
            previewContainer.style.display = 'block';
          }
          reader.readAsDataURL(file);
        } else {
          previewContainer.style.display = 'none';
          preview.src = "";
          alert('Solo se permiten imágenes JPG, JPEG o PNG.');
        }
      }
    });
  });
</script>

</body>
</html>
