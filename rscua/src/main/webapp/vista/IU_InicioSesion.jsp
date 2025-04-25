<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>RSCUA</title>
    <link rel="stylesheet" href="vista/css/InicioStyle.css">
    <script src="https://www.gstatic.com/firebasejs/9.6.1/firebase-app-compat.js"></script>
    <script src="https://www.gstatic.com/firebasejs/9.6.1/firebase-auth-compat.js"></script>
    <script src="${pageContext.request.contextPath}/js/firebase_config.js"></script>
    <script>
        firebase.initializeApp(firebaseConfig);
    </script>
</head>
<body>
<div class="logo">
    <img src="${pageContext.request.contextPath}/vista/imagenes/log_RSCUA.png" alt="Imagen de inicio">
    <div class="glitch"></div>
</div>

<div class="iniciar">
    <h2>Iniciar Sesión</h2>
    <form id="loginForm" action="ControladorInicioSesion" method="post" onsubmit="return validarFormulario()">
        <label for="email">Correo </label>
        <input type="email" id="email" name="email" required>
        <label for="password">Contraseña</label>
        <input type="password" id="password" name="password" required><br>
        <button type="submit">Entrar</button><br>
    </form>

    <!-- Botón de Google -->
    <button id="googleSignInBtn" class="google-btn">
        <img src="${pageContext.request.contextPath}/vista/imagenes/logo_google.png" alt="Google">
    </button>

    <form id="googleLoginForm"
          action="${pageContext.request.contextPath}/ControladorInicioSesion"
          method="post" style="display:none;">
        <input type="hidden" name="idToken" id="idTokenInput">
    </form>

    <div class="separador"></div>
    <form action="ControladorRegistrarse" method="get">
        <button type="submit">Registrarse</button>
    </form>
</div>

<div id="popup" class="popup"></div>

<script>
    function validarFormulario() {
        const email = document.getElementById('email').value;
        const regex = /^[^@]+@[^@]+\.[a-zA-Z]{2,}$/;
        if (!regex.test(email)) {
            mostrarPopup("El correo no es válido", "error");
            return false;
        }
        return true;
    }

    function mostrarPopup(mensaje, tipo) {
        const popup = document.getElementById("popup");
        popup.textContent = mensaje;
        popup.className = "popup " + tipo + " show";
        setTimeout(() => {
            popup.className = "popup";
        }, 3000);
    }

    document.getElementById('googleSignInBtn').addEventListener('click', function () {
        const provider = new firebase.auth.GoogleAuthProvider();
        firebase.auth().signInWithPopup(provider)
            .then(result => result.user.getIdToken())
            .then(idToken => {
                document.getElementById('idTokenInput').value = idToken;
                document.getElementById('googleLoginForm').submit();
            })
            .catch(error => {
                mostrarPopup("No se pudo autenticar con Google: " + error.message, "error");
            });
    });

    // Mensaje desde el controlador
    const mensaje = '<%= request.getAttribute("mensaje") != null ? request.getAttribute("mensaje") : "" %>';
    if (mensaje && mensaje !== "Inicio de sesión exitoso") {
        mostrarPopup(mensaje, "error");
    }
</script>
</body>
</html>