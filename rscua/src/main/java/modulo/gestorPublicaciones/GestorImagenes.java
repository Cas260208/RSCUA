package modulo.gestorPublicaciones;

import javax.imageio.ImageIO;
import javax.servlet.http.Part;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class GestorImagenes {
    private String ubicacionFinal;

    // Ruta absoluta al directorio de "data/usrs"
    private static final String BASE_PATH = "C:/Users/santc/IdeaProjects/RSCUA/rscua/src/main/webapp/data/usrs";

    public boolean guardarImagen(Part imagenPart, String username, String privacidad, int maxAncho) throws IOException {
        // Sanear datos
        username = username.toLowerCase().trim();
        privacidad = privacidad.toLowerCase().trim();

        if (!privacidad.equals("publico") && !privacidad.equals("amigos") && !privacidad.equals("privado")) {
            throw new IllegalArgumentException("Privacidad no válida");
        }

        // Crear directorios si no existen (carpetas "publico", "amigos", "privado" dentro del usuario)
        Path userBaseDir = Paths.get(BASE_PATH, username);
        crearSubcarpetasUsuario(userBaseDir);

        // Ruta específica según privacidad
        Path userPrivacidadDir = userBaseDir.resolve(privacidad);

        // Generar nombre único
        String nombreFinal = System.currentTimeMillis() + "_" + username + ".jpg";
        Path rutaCompleta = userPrivacidadDir.resolve(nombreFinal);

        // Comprimir imagen y guardar
        CompresorImagenes compresor = new CompresorImagenes();
        try (InputStream input = imagenPart.getInputStream()) {
            BufferedImage comprimida = compresor.comprimir(input, maxAncho);
            ImageIO.write(comprimida, "jpg", rutaCompleta.toFile());
        }

        // Ruta relativa para la base de datos
        this.ubicacionFinal = "data/usrs/" + username + "/" + privacidad + "/" + nombreFinal;
        return true;
    }

    /**
     * Crea las carpetas "publico", "amigos" y "privado" dentro de la carpeta de usuario si no existen.
     */
    private void crearSubcarpetasUsuario(Path userBaseDir) throws IOException {
        String[] subfolders = { "publico", "amigos", "privado" };
        if (Files.notExists(userBaseDir)) {
            Files.createDirectories(userBaseDir);
        }

        for (String sub : subfolders) {
            Path subDir = userBaseDir.resolve(sub);
            if (Files.notExists(subDir)) {
                Files.createDirectories(subDir);
            }
        }
    }

    public String getUbicacion() {
        return ubicacionFinal;
    }
}
