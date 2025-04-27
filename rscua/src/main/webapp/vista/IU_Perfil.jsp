<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="modulo.gestorAutenticacion.Usuario" %>
<%@ page import="java.util.List" %>
<%@ page import="modulo.gestorPublicaciones.Publicaciones" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Traemos usuario y sus publicaciones desde el servlet
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    @SuppressWarnings("unchecked")
    List<Publicaciones> misPublicaciones =
            (List<Publicaciones>) request.getAttribute("misPublicaciones");

    Integer seguidoresCount = (Integer) request.getAttribute("seguidoresCount");
    Integer seguidosCount  = (Integer) request.getAttribute("seguidosCount");
    if (seguidoresCount == null) seguidoresCount = 0;
    if (seguidosCount  == null) seguidosCount  = 0;
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Perfil – <%= usuario.getUsername() %></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/PerfilStyle.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/FeedStyle.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/VerPublicacion.css"/>

    <!-- === estilos rápidos para overlay de seguimientos === -->
    <style>
        #overlay-follows{position:fixed;inset:0;background:rgba(0,0,0,.65);
            display:none;align-items:center;justify-content:center;z-index:999;}
        #overlay-follows .panel{width:320px;max-height:80vh;overflow-y:auto;
            background:#fff;border-radius:10px;padding:20px;position:relative;}
        #close-overlay{position:absolute;top:6px;right:8px;border:none;
            background:transparent;font-size:22px;cursor:pointer;}
        .item-follow{display:flex;align-items:center;gap:10px;margin:10px 0;}
        .item-follow .avatar{width:42px;height:42px;border-radius:50%;}
        .item-follow .username{font-weight:600;}
    </style>

</head>
<body>

<!-- BARRA + HEADER -->
<div class="barra">
    <jsp:include page="header.jsp"/>
</div>

<!-- PERFIL -->
<div class="perfil-header">
    <img src="${pageContext.request.contextPath}/vista/imagenes/7772.jpg"
         alt="Foto de Perfil" onclick="alert('Foto de perfil seleccionada')">
    <h1><%= usuario.getNombre() + " " + usuario.getApellido() %></h1>
    <p>@<%= usuario.getUsername() %></p>

    <!-- === Enlaces contadores CORREGIDOS === -->
    <div class="follow-info">
        <a href="#" class="link-follow" data-tipo="seguidores">
            <strong><%= seguidoresCount %></strong> Seguidores
        </a>
        <span class="separator">·</span>
        <a href="#" class="link-follow" data-tipo="siguiendo">
            <strong><%= seguidosCount %></strong> Siguiendo
        </a>
    </div>

</div>

<!-- INFORMACIÓN -->
<div class="informacion">
    <div onclick="alert('Estudia en UAM Cuajimalpa')">
        <img src="${pageContext.request.contextPath}/vista/imagenes/escuela.jpg" alt="Escuela">
        <span>Estudia en 'UAM Cuajimalpa'</span>
    </div>
    <div onclick="alert('Relación')">
        <img src="${pageContext.request.contextPath}/vista/imagenes/relacion.jpg" alt="Relación">
        <span>En una relación con 'CasZrd'</span>
    </div>
    <div onclick="alert('Ubicación')">
        <img src="${pageContext.request.contextPath}/vista/imagenes/ubicacion.jpg" alt="Ubicación">
        <span>Vive en CDMX</span>
    </div>
    <div onclick="alert('Escuchando música')">
        <img src="${pageContext.request.contextPath}/vista/imagenes/musica.jpg" alt="Música">
        <span>Escuchando: 'Confieso - Kanye García West'</span>
    </div>
    <div onclick="alert('Guardados')">
        <img src="${pageContext.request.contextPath}/vista/imagenes/guardar.jpg" alt="Guardar">
        <span>Guardados</span>
    </div>
</div>

<!-- HISTORIAS (estáticas) -->
<div class="historias-container">
    <div class="crear-historia" onclick="location.href='${pageContext.request.contextPath}/vista/IU_CrearHistoria.jsp'">
        <p>+ Crear Historia</p>
    </div>
    <div class="historia"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-1.jpeg" alt="Historia 1"></div>
    <div class="historia"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-2.jpeg" alt="Historia 2"></div>
    <div class="historia"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-3.jpeg" alt="Historia 3"></div>
    <div class="historia"><img src="${pageContext.request.contextPath}/vista/imagenes/Historia-4.jpeg" alt="Historia 4"></div>
    <!-- si luego agregas más historias, inclúyelas también aquí -->
</div>

<!-- FORMULARIO CREAR PUBLICACIÓN -->
<div class="IU_CrearPublicacion">
    <jsp:include page="IU_CrearPublicacion.jsp"/>
</div>

<!-- Feed de publicaciones -->
<div class="feed-publicaciones">
    <h2>Mis Publicaciones</h2>

    <c:if test="${empty misPublicaciones}">
        <p class="sin-public">Todavía no has publicado nada.</p>
    </c:if>

    <c:forEach var="pub" items="${misPublicaciones}">
        <div class="post-container" id="post-<c:out value='${pub.id}'/>">

            <!-- Header con avatar y menú ⋮ -->
            <div class="header">
                <div style="display: flex; align-items: center;">
                    <img src="${pageContext.request.contextPath}/vista/imagenes/777.jpg" alt="Perfil">
                    <span class="username">@<c:out value="${usuario.username}"/></span>
                </div>
                <div class="options-menu">
                    <button class="options-button" onclick="toggleDropdown(this)">
                        <img src="${pageContext.request.contextPath}/vista/imagenes/options.jpg" alt="Opciones">
                    </button>
                    <div class="options-dropdown">
                        <ul>
                            <li>
                                <a href="ControladorPerfil?accion=eliminarPublicacion&id=${pub.id}">
                                    Eliminar publicación
                                </a>
                            </li>
                            <li onclick="reportPost(<c:out value='${pub.id}'/>)">Reportar publicación</li>
                            <li onclick="editPost(<c:out value='${pub.id}'/>)">Editar publicación</li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Contenido -->
            <div class="content">
                <p><c:out value="${pub.texto}"/></p>
                <div class="images">
                    <c:if test="${not empty pub.imagen}">
                        <img src="${pageContext.request.contextPath}/${pub.imagen}" alt="Imagen publicación">
                    </c:if>
                </div>
            </div>

            <!-- Footer con botones -->
            <div class="footer">
                <button onclick="likePost(<c:out value='${pub.id}'/>)">
                    <img src="${pageContext.request.contextPath}/vista/imagenes/like.jpg" alt="Like">
                </button>
                <button onclick="mostrarComentarios(this)">
                    <img src="${pageContext.request.contextPath}/vista/imagenes/comentar.jpg" alt="Comment">
                </button>
                <button onclick="mostrarModalCompartir(<c:out value='${pub.id}'/>)">
                    <img src="${pageContext.request.contextPath}/vista/imagenes/compartir.jpg" alt="Compartir">
                </button>
                <button onclick="mostrarModalGuardar(<c:out value='${pub.id}'/>)">
                    <img src="${pageContext.request.contextPath}/vista/imagenes/guardar.jpg" alt="Guardar">
                </button>
            </div>

            <!-- Sección de comentarios -->
            <div class="seccion-comentarios">
                <div class="comentarios-antiguos">
                    <!-- Aquí podrías iterar comentarios reales -->
                </div>
                <div class="nuevo-comentario">
                    <textarea placeholder="Escribe un comentario..."></textarea>
                    <button class="btn-enviar" onclick="postComment(this)">
                        <img src="${pageContext.request.contextPath}/vista/imagenes/send.png" alt="Enviar">
                    </button>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<!-- Scripts de interacción idénticos a IU_VerPublicacion -->
<script>
    function toggleDropdown(btn) {
        btn.nextElementSibling.classList.toggle('show');
    }
    function deletePost(id) { alert('Eliminar post ' + id); }
    function reportPost(id) { alert('Reportar post ' + id); }
    function editPost(id)  { alert('Editar post ' + id); }

    function likePost(id)  { alert('Me gusta al post ' + id); }

    function mostrarComentarios(btn) {
        const cont = btn.closest('.post-container')
            .querySelector('.seccion-comentarios');
        cont.style.display = cont.style.display === 'block' ? 'none' : 'block';
    }

    function mostrarModalCompartir(id) {
        // crea o muestra un modal igual al de IU_VerPublicacion
        alert('Mostrar modal compartir post ' + id);
    }
    function mostrarModalGuardar(id) {
        alert('Mostrar modal guardar post ' + id);
    }

    function postComment(b) {
        const txt = b.previousElementSibling.value.trim();
        if (txt) alert('Comentaste: ' + txt);
        b.previousElementSibling.value = '';
    }

    // Cerrar dropdown al clicar fuera
    document.addEventListener('click', e => {
        document.querySelectorAll('.options-dropdown.show').forEach(dd => {
            if (!dd.contains(e.target) && !dd.previousElementSibling.contains(e.target))
                dd.classList.remove('show');
        });
    });
</script>

<!-- ░░░░░░░░░░  OVERLAY LISTA DE SEGUIMIENTOS ░░░░░░░░░░ -->
<div id="overlay-follows">
    <div class="panel">
        <button id="close-overlay">✕</button>
        <h3 id="titulo-overlay">Seguidores</h3>
        <ul id="lista-follows"></ul>
    </div>
</div>

<!-- plantilla para un ítem -->
<template id="tpl-item-follow">
    <li class="item-follow">
        <img class="avatar" src="" alt="Foto">
        <span class="username"></span>
    </li>
</template>

<!-- ==========  JS del overlay  ========== -->
<script>
    /* ---------- overlay seguimientos ---------- */
    const ctx = '<%= request.getContextPath() %>';   //  ←  /rscua_war_exploded  (por ejemplo)

    document.querySelectorAll('.link-follow').forEach(el=>{
        el.addEventListener('click', ev=>{
            ev.preventDefault();

            const tipo = ev.currentTarget.dataset.tipo;      // seguidores | siguiendo
            fetch(`${ctx}/ControladorSeguimientos?tipo=${tipo}&ajax=1`)   //  ← AQUÍ
                .then(r => r.json())
                .then(data =>{
                    rellenarOverlay(tipo, data);
                    document.getElementById('overlay-follows').style.display = 'flex';
                })
                .catch(()=>alert('No se pudo cargar ' + tipo));
        });
    });



    document.getElementById('close-overlay')
        .addEventListener('click',()=>(
            document.getElementById('overlay-follows').style.display='none'));

    function rellenarOverlay(tipo, arr){
        document.getElementById('titulo-overlay').textContent =
            (tipo === 'seguidores') ? 'Seguidores' : 'Siguiendo';

        const ul  = document.getElementById('lista-follows');
        ul.innerHTML = '';
        const tpl = document.getElementById('tpl-item-follow').content;

        arr.forEach(obj=>{
            const li = tpl.cloneNode(true);
            li.querySelector('.avatar').src        = obj.foto;
            li.querySelector('.username').textContent = '@'+obj.user;
            ul.appendChild(li);
        });
    }
</script>

</body>
</html>

