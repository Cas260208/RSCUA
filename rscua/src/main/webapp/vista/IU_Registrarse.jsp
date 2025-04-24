<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>RSCUA - Registrarse</title>
    <link rel="stylesheet" href="vista/css/RegistrarseStyle.css">
</head>
<body>

<!-- Popup central para mensaje -->
<% if (request.getAttribute("mensaje") != null) { %>
<div class="popup show success"><%= request.getAttribute("mensaje") %></div>
<% } else if (request.getAttribute("error") != null) { %>
<div class="popup show error"><%= request.getAttribute("error") %></div>
<% } %>

<!-- Logo con glitch -->
<div class="logo">
    <img src="${pageContext.request.contextPath}/vista/imagenes/log_RSCUA.png" alt="Logo RSCUA">
    <div class="glitch"></div>
</div>

<!-- Formulario de Registro -->
<div class="crear">
    <h2>Crear cuenta</h2>
    <form id="registroForm" action="ControladorRegistrarse" method="post" onsubmit="return validarRegistro()">
        <label for="name">Nombre Completo</label>
        <input type="text" id="name" name="name" required>

        <label for="lastname">Apellido</label>
        <input type="text" id="lastname" name="lastname" required>

        <label for="fn">Fecha de Nacimiento</label>
        <input type="date" id="fn" name="fn" required>

        <label for="sex">Sexo</label>
        <select id="sex" name="sex" required>
            <option value="">Seleccione</option>
            <option value="Masculino">Masculino</option>
            <option value="Femenino">Femenino</option>
        </select>

        <label for="username">Nombre Usuario</label>
        <input type="text" id="username" name="username" required>

        <label for="phone">Celular</label>
        <input type="tel" id="phone" name="phone" required>

        <label for="email">Correo</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Contraseña</label>
        <input type="password" id="password" name="password" required>

        <br>
        <button type="submit">Registrarse</button>
    </form>

    <form action="ControladorInicioSesion" method="get" style="margin-top: 10px;">
        <button class="boton-iniciar" type="submit">Iniciar Sesión Con Cuenta</button>
    </form>
</div>

<!-- Validaciones en JS -->
<script>
    function validarRegistro() {
        const nombre = document.getElementById("name").value.trim();
        const apellido = document.getElementById("lastname").value.trim();
        const celular = document.getElementById("phone").value.trim();
        const correo = document.getElementById("email").value.trim();

        const soloLetras = /^[A-Za-zÁÉÍÓÚáéíóúÑñ\s]+$/;
        const soloNumeros = /^[0-9]{10}$/;
        const correoValido = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!soloLetras.test(nombre)) {
            alert("RSCUA dice: El nombre solo debe contener letras.");
            return false;
        }
        if (!soloLetras.test(apellido)) {
            alert("RSCUA dice: El apellido solo debe contener letras.");
            return false;
        }
        if (!soloNumeros.test(celular)) {
            alert("RSCUA dice: El celular debe tener 10 dígitos numéricos.");
            return false;
        }
        if (!correoValido.test(correo)) {
            alert("RSCUA dice: El correo no es válido.");
            return false;
        }

        return true;
    }
</script>
</body>
</html>
