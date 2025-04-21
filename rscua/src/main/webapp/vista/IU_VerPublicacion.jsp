<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modulo.gestorAutenticacion.Usuario" %>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    String nombreCompleto = usuario.getNombre() + " " + usuario.getApellido();
    String username = usuario.getUsername();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <link rel="stylesheet" href="vista/css/VerPublicacion.css">
</head>
<body>
<div class="post-container">
    <div class="header">
        <div style="display: flex; align-items: center;">
            <img src="${pageContext.request.contextPath}/vista/imagenes/777.jpg" alt="Perfil">
            <span class="username">@<%= username %></span>
        </div>
        <div class="options-menu">
            <button class="options-button">
                <img src="${pageContext.request.contextPath}/vista/imagenes/options.jpg" alt="Opciones">
            </button>
            <div class="options-dropdown">
                <ul>
                    <li>Reportar publicacion</li>
                    <li>Eliminar publicacion</li>
                    <li>Editar publicacion</li>
                </ul>
            </div>
        </div>

    </div>
    <div class="modal-compartir" id="modalCompartir" style="display: none;">
        <div class="modal-content">
            <p class="modal-texto">¿Estás seguro de compartir esta publicación?</p>
            <div class="modal-botones">
                <button class="btn-no" onclick="cerrarModal()">No</button>
                <button class="btn-si" onclick="confirmarCompartir()">Sí</button>
            </div>
        </div>
    </div>

    <div class="modal-compartir" id="modalGuardar" style="display: none;">
        <div class="modal-content">
            <p class="modal-texto">¿Estás seguro de guardar esta publicación?</p>
            <div class="modal-botones">
                <button class="btn-no" onclick="cerrarModalGuardar()">No</button>
                <button class="btn-si" onclick="confirmarGuardar()">Sí</button>
            </div>
        </div>
    </div>

    <div class="content">
        <p>Un estilo diferente para el día de hoy.</p>
        <div class="images">
            <img src="${pageContext.request.contextPath}/vista/imagenes/p1.jpg" alt="Imagen 1">
            <img src="${pageContext.request.contextPath}/vista/imagenes/p2.jpg" alt="Imagen 2">
        </div>
    </div>
    <div class="footer">
        <button><img src="${pageContext.request.contextPath}/vista/imagenes/like.jpg" alt="Like"></button>
        <!-- Botón de comentar con función -->
        <button onclick="mostrarComentarios(this)">
            <img src="${pageContext.request.contextPath}/vista/imagenes/comentar.jpg" alt="Comment">
        </button>
        <button onclick="mostrarModalCompartir()">
            <img src="${pageContext.request.contextPath}/vista/imagenes/compartir.jpg" alt="Compartir">
        </button>
        <button onclick="mostrarModalGuardar()">
            <img src="${pageContext.request.contextPath}/vista/imagenes/guardar.jpg" alt="Guardar">
        </button>
    </div>

    <div class="seccion-comentarios">
        <div class="comentarios-antiguos">
            <p><span class="coment-usuario">Carla:</span> Esta foto me encanta 😍</p>
            <p><span class="coment-usuario">Lucas:</span> Había mucho fuego 🔥</p>
        </div>

        <div class="nuevo-comentario">
            <textarea placeholder="Escribe un comentario..."></textarea>
            <button class="btn-enviar" onclick="alert('Simulación: comentario enviado')">
                <img src="${pageContext.request.contextPath}/vista/imagenes/send.png" alt="Enviar">
            </button>
        </div>
    </div>
</div>
<script>
    function mostrarComentarios(btn) {
        const postContainer = btn.closest('.post-container');
        const comentariosDiv = postContainer.querySelector('.seccion-comentarios');
        comentariosDiv.style.display = (comentariosDiv.style.display === "none" || comentariosDiv.style.display === "") ? "block" : "none";
    }

    function mostrarModalCompartir() {
        document.getElementById('modalCompartir').style.display = 'flex';
    }

    function cerrarModal() {
        document.getElementById('modalCompartir').style.display = 'none';
    }

    function confirmarCompartir() {
        alert("Publicación compartida");
        cerrarModal();
    }

        function mostrarModalGuardar() {
        document.getElementById('modalGuardar').style.display = 'flex';
    }

        function cerrarModalGuardar() {
        document.getElementById('modalGuardar').style.display = 'none';
    }

        function confirmarGuardar() {
        alert("Publicación guardada");
        cerrarModalGuardar();
    }

</script>


</body>
</html>

