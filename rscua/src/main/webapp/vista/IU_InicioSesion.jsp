<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>RSCUA</title>
    <link rel="stylesheet" href="vista/css/InicioStyle.css">
    <script src="https://www.gstatic.com/firebasejs/9.22.2/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/9.22.2/firebase-auth.js"></script>
    <script>
        // Tu configuración de Firebase (obtenida de la consola)
        const firebaseConfig = {
            apiKey: "TU_API_KEY",
            authDomain: "TU_AUTH_DOMAIN",
            projectId: "TU_PROJECT_ID",
            storageBucket: "TU_STORAGE_BUCKET",
            messagingSenderId: "TU_MESSAGING_SENDER_ID",
            appId: "TU_APP_ID"
        };

        // Inicializar Firebase
        firebase.initializeApp(firebaseConfig);
        const auth = firebase.auth();

        // Función para iniciar sesión con Firebase (por ejemplo, email/password o Google)
        function firebaseLogin() {
            // Ejemplo: login con email y password (puedes adaptarlo a otros proveedores)
            const email = document.getElementById("firebase-email").value;
            const password = document.getElementById("firebase-password").value;
            auth.signInWithEmailAndPassword(email, password)
                .then((userCredential) => {
                    // Obtén el ID token y envíalo al servidor
                    userCredential.user.getIdToken().then((idToken) => {
                        // Puedes enviar el token por AJAX o incluirlo en un formulario oculto y enviarlo a un nuevo servlet
                        // Ejemplo con AJAX (usando fetch):
                        fetch("ControladorFirebaseAuth", {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/x-www-form-urlencoded"
                            },
                            body: "idToken=" + encodeURIComponent(idToken)
                        }).then(response => {
                            if(response.ok){
                                window.location.href = "ControladorFeed";
                            }
                        });
                    });
                })
                .catch((error) => {
                    console.error("Firebase login error: ", error);
                    alert("Error en Firebase login: " + error.message);
                });
        }
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
    <div class="separador">
    </div>
    <form action="ControladorRegistrarse" method="get">
        <button type="submit">Registrarse</button>
    </form>
</div>
</body>
</html>