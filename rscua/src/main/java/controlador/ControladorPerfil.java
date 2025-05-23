package controlador;

import modulo.gestorAutenticacion.Usuario;
import modulo.gestorPublicaciones.GestorPublicaciones;
import modulo.gestorPublicaciones.Publicaciones;
import modulo.gestorSeguimientos.GestorSeguimientos;

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
    private final  GestorSeguimientos gestorSeguimientos  = new GestorSeguimientos();   // ← NUEVO


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

                /* ───────── 4) CONTADORES Seguimientos ───────── */
                int seguidores = gestorSeguimientos.cargarNumeroSeguidores(usuario.getId());
                int seguidos   = gestorSeguimientos.cargarNumeroSeguidos  (usuario.getId());

                // ── 4) Enviar al JSP
                request.setAttribute("misPublicaciones", misPublicaciones);
                request.setAttribute("seguidoresCount", seguidores);   // ← NUEVO
                request.setAttribute("seguidosCount",   seguidos);     // ← NUEVO
            }

            request.getRequestDispatcher("vista/IU_Perfil.jsp")
                    .forward(request, response);

        } else if ("eliminarPublicacion".equals(accion)) {
            // ── 1) Recuperar id de la publicación a eliminar
            String idParam = request.getParameter("id");
            if (idParam != null) {
                try {
                    int idPub = Integer.parseInt(idParam);
                    // ── 2) Llamar al gestor para borrar de la BD
                    gestorPublicaciones.eliminarPublicacion(idPub);
                } catch (NumberFormatException e) {
                    // id no numérico: ignorar o loggear
                }
            }
            // ── 3) Volver a cargar el perfil con las publicaciones actualizadas
            HttpSession session = request.getSession();
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            if (usuario != null) {
                List<Publicaciones> misPublicaciones =
                        gestorPublicaciones.obtenerPublicacionesPorUsuario(usuario.getId());
                misPublicaciones.sort(
                        Comparator.comparing(Publicaciones::getFechaPublicacion)
                                .reversed()
                );
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

