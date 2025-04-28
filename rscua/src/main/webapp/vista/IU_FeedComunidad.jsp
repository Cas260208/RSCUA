<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Feed de Comunidad</title>
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

        .feed {
            margin: 20px 50px;
            padding: 20px 30px;
            border: 1px solid ${esOscuro ? '#444' : '#ccc'};
            border-radius: 15px;
            background-color: ${esOscuro ? '#1e1e1e' : '#f9f9f9'};
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

        .post {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid ${esOscuro ? '#444' : '#ccc'};
            border-radius: 8px;
            background-color: ${esOscuro ? '#2e2e2e' : '#f9f9f9'};
        }
    </style>
</head>
<body>

<div class="barra">
    <jsp:include page="header.jsp"></jsp:include>
</div>

<div class="feed">
    <h1>Feed de la Comunidad</h1>
    <p>ID de la comunidad: ${comunidadId}</p>

    <!-- Ejemplo de posts -->
    <div class="post">
        <h3>Publicación 1</h3>
        <p>Contenido de la publicación...</p>
    </div>

    <div class="post">
        <h3>Publicación 2</h3>
        <p>Otro contenido de la publicación...</p>
    </div>
</div>

</body>
</html>