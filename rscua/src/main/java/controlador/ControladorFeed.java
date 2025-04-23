package controlador;

import modulo.gestorAutenticacion.Usuario;
import modulo.gestorAutenticacion.masterslave.MasterUsuario;
import modulo.gestorAutenticacion.masterslave.SlaveFeed;
import modulo.gestorAutenticacion.masterslave.Autenticacion;
import modulo.gestorPublicaciones.Publicaciones;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/ControladorFeed")
public class ControladorFeed extends HttpServlet {

    private Autenticacion authSvc;

    @Override
    public void init() throws ServletException {
        // Inicializamos nuestro punto de entrada al patrón Master–Slave
        authSvc = new Autenticacion();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        // Validar la acción solicitada
        if ("feed".equals(accion)) {
            cargarPublicaciones(request, response); // Llamar al método que prepara las publicaciones
        } else {
            request.getRequestDispatcher("vista/IU_Feed.jsp")
                    .forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Redirigir al método para cargar publicaciones
        cargarPublicaciones(request, response);
    }

    /**
     * Método para cargar las publicaciones y redirigir al JSP
     */
    private void cargarPublicaciones(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // 1) Recupera el usuario de la sesión
            HttpSession session = request.getSession();
            Usuario usuario = (Usuario) session.getAttribute("usuario");

            // 2) Orquesta con Autenticacion → MasterUsuario → SlaveFeed
            MasterUsuario master = authSvc.dispatch(usuario);
            List<Publicaciones> publicaciones = master.ejecucionFeed(usuario.getId());

            // 3) Pasa la lista al JSP
            request.setAttribute("publicaciones", publicaciones);

            // 4) Forward al JSP
            request.getRequestDispatcher("vista/IU_Feed.jsp")
                    .forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("vista/IU_Error.jsp"); // Redirigir a una página de error en caso de fallo
        }
    }
}
