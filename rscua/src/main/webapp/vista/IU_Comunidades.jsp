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

    <c:forEach var="comunidad" items="${['Tecnología', 'Libros', 'Gaming', 'Arte y Diseño', 'Fitness y Salud', 'Viajeros del Mundo', 'Cine y Series', 'Emprendedores']}">
        <div class="comunidad-item">
            <div class="comunidad-info">
                <h2>${comunidad}</h2>
                <p>Descripción de la comunidad ${comunidad.toLowerCase()}.</p>
            </div>
            <div class="acciones">
                <button onclick="mostrarModal('¿Deseas unirte a ${comunidad}?')">Unirse</button>
                <button onclick="mostrarModal('¿Deseas reportar la comunidad ${comunidad}?')">Reportar</button>
            </div>
        </div>
    </c:forEach>
</div>

<!-- Modal emergente -->
<div id="modal" class="modal">
    <div class="modal-content">
        <span class="cerrar" onclick="cerrarModal()">&times;</span>
        <p id="mensaje-modal">Mensaje de confirmación</p>
        <button onclick="cerrarModal()">Aceptar</button>
    </div>
</div>

<script>
    function mostrarModal(mensaje) {
        document.getElementById("mensaje-modal").innerText = mensaje;
        document.getElementById("modal").style.display = "block";
    }

    function cerrarModal() {
        document.getElementById("modal").style.display = "none";
    }

    // Cierre al hacer clic fuera del modal
    window.onclick = function(event) {
        const modal = document.getElementById("modal");
        if (event.target === modal) {
            modal.style.display = "none";
        }
    }
</script>

</body>
</html>
