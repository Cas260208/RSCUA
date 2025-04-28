package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorFeedComunidades", urlPatterns = {"/ControladorFeedComunidades"})
public class ControladorFeedComunidades extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String comunidadIdParam = request.getParameter("comunidadId");

        if (comunidadIdParam == null || comunidadIdParam.trim().isEmpty()) {
            response.sendRedirect("vista/IU_Error.jsp?mensaje=ID de comunidad no proporcionado");
            return;
        }

        int comunidadId;
        try {
            comunidadId = Integer.parseInt(comunidadIdParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("vista/IU_Error.jsp?mensaje=ID de comunidad inválido");
            return;
        }

        switch (accion) {
            case "comunidades":
                request.getRequestDispatcher("vista/IU_Comunidades.jsp").forward(request, response);
                break;
            case "unirse":

                request.setAttribute("comunidadId", comunidadId);
                request.getRequestDispatcher("vista/IU_FeedComunidad.jsp").forward(request, response);
                break;
            default:
                response.sendRedirect("vista/IU_Busqueda.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}