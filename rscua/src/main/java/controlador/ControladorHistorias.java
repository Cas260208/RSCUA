package controlador;

import modulo.gestorAutenticacion.Usuario;
import modulo.gestorHistorias.GestorHistorias;
import modulo.gestorHistorias.GestorImagenes;
import modulo.gestorHistorias.Historia;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/ControladorHistorias")
@MultipartConfig
public class ControladorHistorias extends HttpServlet {
    private GestorHistorias gestorHistorias;

    @Override
    public void init() throws ServletException {
        gestorHistorias = new GestorHistorias();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String texto = request.getParameter("descripcion");
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
        int usuarioId = usuario != null ? usuario.getId() : -1;

        Historia nueva = new Historia();
        nueva.setTexto(texto);
        nueva.setIdUsuario(usuarioId);
        nueva.setFechaPub(new Timestamp(System.currentTimeMillis()));

        Part imagenPart = request.getPart("imagen");
        if (imagenPart != null && imagenPart.getSize() > 0) {
            String basePath = request.getServletContext().getRealPath("/data/historias");
            GestorImagenes imgG = new GestorImagenes(basePath);
            imgG.guardarImagen(imagenPart, usuario.getUsername(), 1080);
            nueva.setFotourl(imgG.getUbicacion());
        }

        boolean ok = gestorHistorias.publicarHistoria(nueva);
        if (ok) {
            response.sendRedirect("ControladorFeed");
        } else {
            response.sendRedirect("vista/IU_CrearHistoria.jsp?error=No se pudo crear la historia");
        }
    }


}
