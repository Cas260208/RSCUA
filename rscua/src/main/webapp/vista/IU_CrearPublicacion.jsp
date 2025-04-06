<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Fragmento para crear publicación -->
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

<!-- Estilos locales para el fragmento -->
<style>
    .crear-publicacion {
        width: 100%;
        max-width: 500px;
        margin-top: 20px;
    }
    .post-header {
        display: flex;
        align-items: center;
        cursor: pointer;
        padding: 10px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }
    .post-header img {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        margin-right: 10px;
    }
    .divider {
        width: 100%;
        height: 2px;
        background-color: #ccc;
        margin: 20px 0;
    }
    .overlay, .modal {
        opacity: 0;
        visibility: hidden;
        transition: opacity 0.3s ease, visibility 0.3s ease;
    }
    .overlay.show, .modal.show {
        opacity: 1;
        visibility: visible;
    }
    .overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: 1;
    }
    .modal {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        width: 90%;
        max-width: 500px;
        padding: 20px;
        z-index: 2;
    }
    .modal .user {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }
    .modal .user img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        margin-right: 10px;
    }
    .modal textarea {
        width: 100%;
        height: 80px;
        resize: none;
        border: 1px solid #ccc;
        border-radius: 5px;
        padding: 10px;
        font-size: 14px;
        box-sizing: border-box;
    }
    .modal label {
        display: block;
        margin: 10px 0 5px;
        font-weight: bold;
    }
    .modal select,
    .modal input {
        width: 100%;
        margin-bottom: 10px;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
        box-sizing: border-box;
    }
    .modal input[type="file"] {
        padding: 5px;
        border: none;
        background-color: #f0f0f0;
        cursor: pointer;
    }
    .actions {
        display: flex;
        justify-content: flex-end;
        margin-top: 10px;
    }
    .actions button {
        border: none;
        padding: 10px 16px;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        margin-left: 10px;
    }
    .actions button[type="button"] {
        background-color: #999;
        color: #fff;
    }
    .actions button[type="button"]:hover {
        background-color: #777;
    }
    .actions button[type="submit"] {
        background-color: #007bff;
        color: #fff;
    }
    .actions button[type="submit"]:hover {
        background-color: #0056b3;
    }
    #preview-container img {
        max-width: 150px;
        max-height: 150px;
        object-fit: cover;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
</style>

<!-- Script local para manejo del modal y vista previa -->
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
