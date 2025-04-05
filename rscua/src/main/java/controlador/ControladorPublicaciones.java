package controlador;

import modulo.gestorPublicaciones.GestorPublicaciones;
import modulo.gestorPublicaciones.Publicaciones;
import modulo.gestorAutenticacion.Usuario;
import modulo.gestorPublicaciones.GestorImagenes;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/ControladorPublicaciones")
@MultipartConfig
public class ControladorPublicaciones extends HttpServlet {
    private GestorPublicaciones gestorPublicaciones;

    @Override
    public void init() throws ServletException {
        gestorPublicaciones = new GestorPublicaciones();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener datos del formulario
        String texto = request.getParameter("texto");
        String etiquetas = request.getParameter("etiquetas");
        String privacidad = request.getParameter("privacidad");

        // Obtener usuario desde la sesión
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        int usuarioId = usuario != null ? usuario.getId() : -1;

        // Crear nueva publicación
        Publicaciones nuevaPublicacion = new Publicaciones();
        nuevaPublicacion.setTexto(texto);
        nuevaPublicacion.setEtiquetas(etiquetas);
        nuevaPublicacion.setUsuarioId(usuarioId);
        nuevaPublicacion.setFechaPublicacion(new Timestamp(System.currentTimeMillis()));

        // Manejar privacidad
        if (privacidad != null) {
            privacidad = privacidad.toUpperCase();
            nuevaPublicacion.setPrivacidad(Publicaciones.Privacidad.valueOf(privacidad));
        } else {
            nuevaPublicacion.setPrivacidad(Publicaciones.Privacidad.PUBLICO);
        }

        // Procesar imagen solo si el usuario la sube
        Part imagenPart = request.getPart("imagen");
        String imagenRuta = null;

        if (imagenPart != null && imagenPart.getSize() > 0) {
            GestorImagenes gestorImagenes = new GestorImagenes();
            gestorImagenes.guardarImagen(imagenPart, usuario.getUsername(), privacidad.toLowerCase(), 1080);
            imagenRuta = gestorImagenes.getUbicacion();
        }

        nuevaPublicacion.setImagen(imagenRuta);

        // Guardar la publicación en la base de datos
        boolean publicada = gestorPublicaciones.crearPublicacion(nuevaPublicacion);

        // Redirigir según resultado
        if (publicada) {
            response.sendRedirect("ControladorFeed");
        } else {
            response.sendRedirect("vista/IU_CrearPublicaciones.jsp?error=No se pudo crear la publicación");
        }
    }
}
