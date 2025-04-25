package controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modulo.gestorComunidades.SolicitudComunidad;
import modulo.gestorComunidades.WholePart.*;
import servicios.Builder.*;

@WebServlet(name = "ControladorComunidades", urlPatterns = {"/ControladorComunidades"})
public class ControladorComunidades extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if ("comunidades".equals(accion)) {
            request.getRequestDispatcher("vista/IU_Comunidades.jsp").forward(request, response);
        } else {
            response.sendRedirect("vista/IU_Busqueda.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
