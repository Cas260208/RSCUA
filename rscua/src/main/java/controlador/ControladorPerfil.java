package controlador;

import modulo.gestorAutenticacion.Usuario;
import modulo.gestorPublicaciones.GestorPublicaciones;
import modulo.gestorPublicaciones.Publicaciones;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Comparator;
import java.util.List;

@WebServlet(name = "ControladorPerfil", urlPatterns = {"/ControladorPerfil"})
public class ControladorPerfil extends HttpServlet {

    // Instancia de GestorPublicaciones
    private GestorPublicaciones gestorPublicaciones = new GestorPublicaciones();

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if ("perfil".equals(accion)) {
            // ── 1) Recuperar usuario de sesión
            HttpSession session = request.getSession();
            Usuario usuario = (Usuario) session.getAttribute("usuario");

            if (usuario != null) {
                // ── 2) Obtener publicaciones desde la BD
                List<Publicaciones> misPublicaciones =
                        gestorPublicaciones.obtenerPublicacionesPorUsuario(usuario.getId());

                // ── 3) Ordenar: más reciente primero
                misPublicaciones.sort(
                        Comparator.comparing(Publicaciones::getFechaPublicacion)
                                .reversed()
                );

                // ── 4) Enviar al JSP
                request.setAttribute("misPublicaciones", misPublicaciones);
            }

            request.getRequestDispatcher("vista/IU_Perfil.jsp")
                    .forward(request, response);

        } else if ("configuracion".equals(accion)) {
            request.getRequestDispatcher("vista/IU_Configuracion.jsp")
                    .forward(request, response);
        } else {
            response.sendRedirect("vista/IU_Perfil.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}

