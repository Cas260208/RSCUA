package modulo.gestorHistorias;

import javax.imageio.ImageIO;
import javax.servlet.http.Part;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 * Gestor de almacenamiento de imágenes para Historias.
 * Se encarga de crear la carpeta de usuario (si no existe),
 * redimensionar/comprimir la imagen y guardarla en disco,
 * y proporcionar la ruta relativa para persistir en BD.
 */
public class GestorImagenes {
    /** Ruta base absoluta al directorio de historias */
    private final String basePath;

    /** Ruta relativa final que se devolverá para almacenar en BD */
    private String ubicacionFinal;

    /**
     * @param basePath Ruta absoluta donde se guardan las historias (ej: .../data/historias)
     */
    public GestorImagenes(String basePath) {
        this.basePath = basePath;
        System.out.println("GestorImagenes inicializado con basePath: " + this.basePath);
    }

    /**
     * Guarda la imagen de la historia:
     * 1) Crea la carpeta de usuario si no existe.
     * 2) Genera un nombre único.
     * 3) Comprime/redimensiona.
     * 4) Escribe el fichero.
     * 5) Guarda la ruta relativa en {@link #ubicacionFinal}.
     *
     * @param imagenPart Parte multipart con la imagen subida.
     * @param username   Nombre de usuario (se usará como carpeta).
     * @param maxAncho   Ancho máximo para redimensionar.
     * @return true si todo se completó sin error.
     * @throws IOException en caso de fallo de I/O.
     */
    public boolean guardarImagen(Part imagenPart, String username, int maxAncho) throws IOException {
        // 1. Normalizar nombre de usuario
        String user = username.toLowerCase().trim();

        // 2. Construir y crear directorio de usuario bajo basePath
        Path userDir = Paths.get(basePath, user);
        if (Files.notExists(userDir)) {
            Files.createDirectories(userDir);
            System.out.println("Directorio de usuario creado: " + userDir);
        }

        // 3. Generar nombre de fichero único con timestamp
        String nombreArchivo = System.currentTimeMillis() + "_" + user + ".jpg";
        Path destino = userDir.resolve(nombreArchivo);

        // 4. Comprimir/redimensionar la imagen
        CompresorImagenes compresor = new CompresorImagenes();
        try (InputStream in = imagenPart.getInputStream()) {
            BufferedImage imgComprimida = compresor.comprimir(in, maxAncho);
            // 5. Guardar en disco en formato JPG
            ImageIO.write(imgComprimida, "jpg", destino.toFile());
        }

        // 6. Preparar ruta relativa para almacenar en base de datos
        //    Ej: "historias/{username}/{nombreArchivo}"
        this.ubicacionFinal = "historias/" + user + "/" + nombreArchivo;
        return true;
    }

    /**
     * @return Ruta relativa de la imagen guardada para persistir en BD.
     *         Null si aún no se ha invocado {@link #guardarImagen}.
     */
    public String getUbicacion() {
        return ubicacionFinal;
    }
}
