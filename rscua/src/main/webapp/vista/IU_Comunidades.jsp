<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Comunidades</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: ${esOscuro ? '#121212' : 'white'};
            color: ${esOscuro ? 'white' : 'black'};
            margin: 0;
            padding: 0;
        }

        .barra {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 40px;
            background-color: ${esOscuro ? '#1e1e1e' : 'white'};
            border-bottom: 1px solid ${esOscuro ? '#333' : 'black'};
            border-radius: 10px;
        }

        .barra img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-color: transparent;
            padding: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.5);
            transition: transform 0.3s ease;
        }

        .barra img:hover {
            transform: scale(1.1);
        }

        .comunidades {
            margin: 20px 50px;
            padding: 20px 30px;
            border: 1px solid ${esOscuro ? '#444' : '#ccc'};
            border-radius: 15px;
            background-color: ${esOscuro ? '#1e1e1e' : '#f9f9f9'};
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .comunidades h1 {
            font-size: 28px;
            margin-bottom: 20px;
        }

        .comunidad-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 15px;
            padding: 15px;
            border: 1px solid ${esOscuro ? '#444' : '#ccc'};
            border-radius: 10px;
            background-color: ${esOscuro ? '#2e2e2e' : '#f9f9f9'};
            transition: transform 0.3s ease, background-color 0.3s ease;
        }

        .comunidad-item:hover {
            transform: scale(1.02);
        }

        .comunidad-info h2 {
            font-size: 20px;
            margin: 0;
        }

        .comunidad-info p {
            font-size: 14px;
            margin: 0;
            color: ${esOscuro ? '#aaa' : '#666'};
        }

        .acciones {
            display: flex;
            gap: 15px;
        }

        .acciones button {
            padding: 10px 15px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: ${esOscuro ? '#444' : '#ddd'};
            color: ${esOscuro ? 'white' : 'black'};
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .acciones button:hover {
            background-color: ${esOscuro ? '#666' : '#bbb'};
            transform: scale(1.1);
        }

        /* Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
        }

        .modal-content {
            background-color: white;
            margin: 15% auto;
            padding: 20px 30px;
            border-radius: 10px;
            width: 400px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .modal-content p {
            margin-bottom: 20px;
            font-size: 18px;
        }

        .modal-content button {
            padding: 10px 20px;
            background-color: #0d6efd;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
        }

        .modal-content button:hover {
            background-color: #0b5ed7;
        }

        .cerrar {
            position: absolute;
            top: 10px;
            right: 20px;
            font-size: 28px;
            font-weight: bold;
            color: white;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="barra">
    <jsp:include page="header.jsp"></jsp:include>
</div>

<div class="comunidades">
    <h1>Explora Comunidades</h1>

    <c:set var="comunidades">
        <c:set var="comunidad1" value="${{'id': 1, 'nombre': 'Tecnología', 'descripcion': 'Comunidad de tecnología y desarrollo'}}" />
        <c:set var="comunidad2" value="${{'id': 2, 'nombre': 'Libros', 'descripcion': 'Amantes de la lectura'}}" />
        <c:set var="comunidad3" value="${{'id': 3, 'nombre': 'Gaming', 'descripcion': 'Videojuegos y eSports'}}" />
        <c:set var="comunidad4" value="${{'id': 4, 'nombre': 'Arte y Diseño', 'descripcion': 'Creatividad artística'}}" />
        <c:set var="comunidad5" value="${{'id': 5, 'nombre': 'Fitness y Salud', 'descripcion': 'Vida saludable'}}" />
        <c:set var="comunidad6" value="${{'id': 6, 'nombre': 'Viajeros del Mundo', 'descripcion': 'Aventuras y viajes'}}" />
        <c:set var="comunidad7" value="${{'id': 7, 'nombre': 'Cine y Series', 'descripcion': 'Entretenimiento audiovisual'}}" />
        <c:set var="comunidad8" value="${{'id': 8, 'nombre': 'Emprendedores', 'descripcion': 'Negocios y startups'}}" />
        <c:set var="comunidadesList" value="${[comunidad1, comunidad2, comunidad3, comunidad4, comunidad5, comunidad6, comunidad7, comunidad8]}" />
    </c:set>

    <c:forEach var="comunidad" items="${comunidadesList}">
        <div class="comunidad-item" data-comunidad-id="${comunidad.id}">
            <div class="comunidad-info">
                <h2>${comunidad.nombre}</h2>
                <p>${comunidad.descripcion}</p>
            </div>
            <div class="acciones">
                <button onclick="manejarAccion('unirse', ${comunidad.id})">Unirse</button>
                <button onclick="manejarAccion('reportar', ${comunidad.id})">Reportar</button>
            </div>
        </div>
    </c:forEach>
</div>

<div id="modal" class="modal">
    <div class="modal-content">
        <span class="cerrar" onclick="cerrarModal()">&times;</span>
        <p id="mensaje-modal">Mensaje de confirmación</p>
        <button id="btn-confirmar" onclick="confirmarAccion()">Aceptar</button>
    </div>
</div>

<script>
    let accionActual = '';
    let comunidadIdActual = 0;

    function manejarAccion(accion, id) {
        accionActual = accion;
        comunidadIdActual = id;

        const mensaje = accion === 'unirse'
            ? `¿Deseas unirte a la comunidad? (ID: ${id})`
            : `¿Reportar la comunidad? (ID: ${id})`;

        document.getElementById("mensaje-modal").innerText = mensaje;
        document.getElementById("modal").style.display = "block";
    }

    function confirmarAccion() {
        // Crear formulario oculto para enviar al controlador
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = 'ControladorFeedComunidades';

        // Input para la acción
        const inputAccion = document.createElement('input');
        inputAccion.type = 'hidden';
        inputAccion.name = 'accion';
        inputAccion.value = accionActual;
        form.appendChild(inputAccion);

        // Input para el ID
        const inputId = document.createElement('input');
        inputId.type = 'hidden';
        inputId.name = 'comunidadId';
        inputId.value = comunidadIdActual;
        form.appendChild(inputId);

        // Enviar formulario
        document.body.appendChild(form);
        form.submit();

        cerrarModal();
    }

    function cerrarModal() {
        document.getElementById("modal").style.display = "none";
    }

    window.onclick = function(event) {
        const modal = document.getElementById("modal");
        if (event.target === modal) {
            cerrarModal();
        }
    }
</script>

</body>
</html>