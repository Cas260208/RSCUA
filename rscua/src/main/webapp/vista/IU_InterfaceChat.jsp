<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>RSCUA - Mensajería</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/vista/css/InterfaceChatstyle.css">
</head>
<body>

<jsp:include page="header.jsp" />

<div class="contenedor-mensajeria">
    <!-- Panel de contactos -->
    <div class="panel-izquierdo">
        <h2>Conversaciones</h2>
        <ul class="lista-contactos">
            <li onclick="abrirChat('Tia Milagros')">Tia Milagros</li>
            <li onclick="abrirChat('El guero')">El guero</li>
            <li onclick="abrirChat('Juan Mecanico')">Juan Mecanico</li>
            <li onclick="abrirChat('Yo')">Yo</li>
        </ul>
    </div>

    <!-- Panel de chat -->
    <div class="panel-derecho">
        <div class="encabezado-chat">
            <h3 id="nombreContacto">Selecciona un chat</h3>
        </div>
        <div class="mensajes" id="mensajesChat">
            <p class="sistema">Aquí aparecerán los mensajes...</p>
        </div>
        <div class="input-mensaje">
            <input type="text" placeholder="Escribe un mensaje..." id="inputTexto">
            <button onclick="enviarMensaje()">Enviar</button>
        </div>
    </div>
</div>

<script>
    function abrirChat(nombre) {
        document.getElementById('nombreContacto').textContent = nombre;
        document.getElementById('mensajesChat').innerHTML = `<p class="sistema">Chat con ${nombre}</p>`;
    }

    function enviarMensaje() {
        const input = document.getElementById('inputTexto');
        const mensaje = input.value.trim();
        if (mensaje !== '') {
            const chat = document.getElementById('mensajesChat');
            const nuevoMensaje = document.createElement('p');
            nuevoMensaje.className = 'mio';
            nuevoMensaje.textContent = mensaje;
            chat.appendChild(nuevoMensaje);
            input.value = '';
            chat.scrollTop = chat.scrollHeight;
        }
    }
</script>

</body>
</html>
