<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Preguntas Generales</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/PreguntasGeneralesStyle.css">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="contenedor-preguntas">
  <h1>Preguntas Generales</h1>

  <div class="formulario-pregunta">
    <textarea placeholder="¿Qué quieres preguntar hoy?" rows="4"></textarea>
    <button>Publicar</button>
  </div>

  <div class="lista-preguntas">
    <div class="pregunta">
      <p class="usuario">@maria23</p>
      <p class="contenido">¿Alguien sabe cómo cambiar el tema del perfil?</p>
    </div>
    <div class="pregunta">
      <p class="usuario">@juanito_dev</p>
      <p class="contenido">¿Puedo subir dos imágenes en una publicación?</p>
    </div>
  </div>
</div>

</body>
</html>
