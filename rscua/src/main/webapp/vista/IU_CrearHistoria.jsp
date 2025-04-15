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

  <form action="#" method="post" enctype="multipart/form-data">

    <label for="etiquetas">Etiquetar usuarios</label>
    <input type="text" id="etiquetas" name="etiquetas" placeholder="@usuario1, @usuario2">

    <label for="ubicacion">Ubicación</label>
    <input type="text" id="ubicacion" name="ubicacion" placeholder="Ciudad, país...">

    <label for="visibilidad">Visibilidad</label>
    <select id="visibilidad" name="visibilidad">
      <option>Público</option>
      <option>Amigos</option>
      <option>Privado</option>
    </select>

    <label for="descripcion">Descripción (opcional)</label>
    <textarea id="descripcion" name="descripcion" placeholder="¿Qué deseas compartir hoy?"></textarea>

    <div class="botones">
      <label class="boton-subir">
        <input type="file" name="archivo" hidden>
        📷 Subir imagen o video
      </label>

      <button type="submit" class="boton-publicar">Publicar historia</button>
    </div>

  </form>
</div>

</body>
</html>
