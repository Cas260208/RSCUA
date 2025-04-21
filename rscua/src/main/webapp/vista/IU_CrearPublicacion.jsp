<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Fragmento para crear publicación -->
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="vista/css/VerPublicacion.css">
</head>
<body>

<div class="crear-publicacion">
    <div class="post-header" id="open-modal">
        <img src="${pageContext.request.contextPath}/vista/imagenes/777.jpg" alt="Perfil">
        <span>¿Qué estás pensando hoy?</span>
    </div>
    <div class="divider"></div>

    <div class="overlay" id="overlay"></div>

    <div class="modal" id="modal">
        <form action="ControladorPublicaciones" method="post" enctype="multipart/form-data">
            <div class="user">
                <img src="${pageContext.request.contextPath}/vista/imagenes/777.jpg" alt="Perfil">
                <span>@Zaganav29</span>
            </div>
            <!-- Campo para contenido -->
            <textarea name="texto" placeholder="¿Qué estás pensando hoy?"></textarea>

            <!-- Subir imagen -->
            <label for="imagen">Subir Imagen (JPG, JPEG o PNG):</label>
            <input type="file" name="imagen" id="imagen" accept="image/jpeg, image/jpg, image/png">

            <div id="preview-container" style="margin-top:10px; display: none;">
                <p>Vista previa:</p>
                <img id="preview" src="" alt="Vista previa de imagen">
            </div>

            <!-- Etiquetas -->
            <label for="etiquetas">Etiquetas (separadas por comas):</label>
            <input type="text" name="etiquetas" id="etiquetas" placeholder="Ejemplo: naturaleza, tecnología">

            <!-- Privacidad -->
            <label for="privacidad">Privacidad:</label>
            <select name="privacidad" id="privacidad">
                <option value="publico">Público</option>
                <option value="amigos">Amigos</option>
                <option value="privado">Privado</option>
            </select>

            <div class="actions">
                <button type="button" id="cancelar-btn">Cancelar</button>
                <button type="submit">Publicar</button>
            </div>
        </form>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        const form = document.querySelector('.modal form');
        const imagenInput = document.getElementById('imagen');
        const previewContainer = document.getElementById('preview-container');
        const preview = document.getElementById('preview');
        const overlay = document.getElementById('overlay');
        const modal = document.getElementById('modal');
        const openModal = document.getElementById('open-modal');
        const cancelarBtn = document.getElementById('cancelar-btn');

        if (openModal) {
            openModal.addEventListener('click', () => {
                modal.classList.add('show');
                overlay.classList.add('show');
            });
        }

        function cerrarModalYResetear() {
            modal.classList.remove('show');
            overlay.classList.remove('show');
            form.reset();
            imagenInput.value = "";
            preview.src = "";
            previewContainer.style.display = 'none';
        }

        overlay.addEventListener('click', cerrarModalYResetear);
        cancelarBtn.addEventListener('click', cerrarModalYResetear);

        imagenInput.addEventListener('change', function () {
            const file = imagenInput.files[0];
            if (file) {
                const allowedExtensions = ['image/jpeg', 'image/jpg', 'image/png'];
                if (allowedExtensions.includes(file.type)) {
                    const reader = new FileReader();
                    reader.onload = function (e) {
                        const img = new Image();
                        img.src = e.target.result;
                        img.onload = function () {
                            const canvas = document.createElement('canvas');
                            const MAX_WIDTH = 800;
                            const scale = MAX_WIDTH / img.width;
                            canvas.width = MAX_WIDTH;
                            canvas.height = img.height * scale;

                            const ctx = canvas.getContext('2d');
                            ctx.drawImage(img, 0, 0, canvas.width, canvas.height);

                            canvas.toBlob(function (blob) {
                                const compressedFile = new File([blob], file.name, { type: 'image/jpeg' });
                                const dataTransfer = new DataTransfer();
                                dataTransfer.items.add(compressedFile);
                                imagenInput.files = dataTransfer.files;

                                preview.src = URL.createObjectURL(compressedFile);
                                previewContainer.style.display = 'block';
                            }, 'image/jpeg', 0.7);
                        }
                    }
                    reader.readAsDataURL(file);
                } else {
                    previewContainer.style.display = 'none';
                    preview.src = "";
                    alert('Solo se permiten imágenes JPG, JPEG o PNG.');
                }
            }
        });

        form.addEventListener('submit', function (e) {
            const file = imagenInput.files[0];
            if (file) {
                const allowedExtensions = ['image/jpeg', 'image/jpg', 'image/png'];
                if (!allowedExtensions.includes(file.type)) {
                    e.preventDefault();
                    alert('Solo se permiten imágenes JPG, JPEG o PNG.');
                    return false;
                }
            }
        });
    });
</script>
</body>
</html>


