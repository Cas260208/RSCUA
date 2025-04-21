<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>RSCUA</title>
    <link rel="stylesheet" href="vista/css/InicioStyle.css">
    <!-- Firebase JS SDKs -->
    <script src="https://www.gstatic.com/firebasejs/9.6.1/firebase-app-compat.js"></script>
    <script src="https://www.gstatic.com/firebasejs/9.6.1/firebase-auth-compat.js"></script>
    <script src="${pageContext.request.contextPath}/js/firebase_config.js"></script>
    <script>
        // Inicializa Firebase en el cliente
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
    <form action="ControladorInicioSesion" method="post">
        <label for="email">Correo </label>
        <input type="email" id="email" name="email" required>
        <label for="password">Contraseña</label>
        <input type="password" id="password" name="password" required><br>
        <button type="submit">Entrar</button><br>
    </form>

    <!-- Botón de Google -->
    <button id="googleSignInBtn">Iniciar sesión con Google</button>


    <!-- Form oculto para enviar el ID token al servlet -->
    <form id="googleLoginForm"
          action="${pageContext.request.contextPath}/ControladorInicioSesion"
          method="post" style="display:none;">
        <input type="hidden" name="idToken" id="idTokenInput">
    </form>

    <div class="separador">
    </div>
    <form action="ControladorRegistrarse" method="get">
        <button type="submit">Registrarse</button>
    </form>


</div>
<!-- Script de OAuth Google -->
<script>
    document.getElementById('googleSignInBtn').addEventListener('click', function() {
        const provider = new firebase.auth.GoogleAuthProvider();
        firebase.auth().signInWithPopup(provider)
            .then(result => result.user.getIdToken())
            .then(idToken => {
                // Inserta el token en el form oculto y lo envía
                document.getElementById('idTokenInput').value = idToken;
                document.getElementById('googleLoginForm').submit();
            })
            .catch(error => {
                console.error('Error en OAuth Google:', error);
                alert('No se pudo autenticar con Google: ' + error.message);
            });
    });
</script>

</body>
</html>