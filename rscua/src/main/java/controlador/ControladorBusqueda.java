package controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorBusqueda", urlPatterns = {"/ControladorBusqueda"})
public class ControladorBusqueda extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String query = request.getParameter("query");

        if ("buscar".equals(accion)) {
            //Simular busqueda
            request.setAttribute("resultados", obtenerResultados(query));
            request.getRequestDispatcher("vista/IU_Busqueda.jsp").forward(request, response);
        } else if ("configuracion".equals(accion)) {
            //Redirección a IU_Configuracion.jsp
            request.getRequestDispatcher("vista/IU_Configuracion.jsp").forward(request, response);
        } else if ("busqueda".equals(accion)) {
            //Acción por defecto o redirección
            response.sendRedirect("vista/IU_Busqueda.jsp");
        } else if ("perfil".equals(accion)) {
            response.sendRedirect("vista/IU_Perfil.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    //Método auxiliar para simular búsqueda
    private String obtenerResultados(String query) {
        return query == null ? "No se ingresó ninguna palabra clave" : "Resultados para: " + query;
    }
}
