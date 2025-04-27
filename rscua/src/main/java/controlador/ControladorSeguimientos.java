package controlador;

import modulo.gestorSeguimientos.GestorSeguimientos;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ControladorSeguimientos")
public class ControladorSeguimientos extends HttpServlet {

    private GestorSeguimientos gestorSeguimientos;


    @Override
    public void init() throws ServletException {
        gestorSeguimientos = new GestorSeguimientos();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");

        request.getRequestDispatcher("vista/IU_Seguimientos.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

}
