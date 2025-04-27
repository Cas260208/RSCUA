package modulo.gestorHistorias;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.InputStream;

public class CompresorImagenes {

    /**  Hay 2 compresores de imagenes por si para publicaciones e historias fuera diferente procesamiento de comp.
     * Redimensiona y comprime una imagen recibida como InputStream.
     * Retorna un BufferedImage comprimido sin guardarlo en disco.
     *
     * @param imagenInputStream InputStream de la imagen original.
     * @param maxAncho Ancho máximo permitido.
     * @return BufferedImage comprimido y redimensionado.
     * @throws IOException en caso de error de lectura.
     */
    public BufferedImage comprimir(InputStream imagenInputStream, int maxAncho) throws IOException {
        // Leer la imagen desde el InputStream
        BufferedImage original = ImageIO.read(imagenInputStream);

        int newAncho = original.getWidth();
        int newAlto = original.getHeight();

        // Redimensionar si la imagen excede el ancho máximo
        if (original.getWidth() > maxAncho) {
            double scale = (double) maxAncho / original.getWidth();
            newAncho = maxAncho;
            newAlto = (int) (original.getHeight() * scale);
        }

        // Crear una imagen redimensionada
        BufferedImage redimensionada = new BufferedImage(newAncho, newAlto, BufferedImage.TYPE_INT_RGB);
        Graphics2D g2d = redimensionada.createGraphics();
        g2d.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        g2d.drawImage(original, 0, 0, newAncho, newAlto, null);
        g2d.dispose();

        return redimensionada;
    }
}