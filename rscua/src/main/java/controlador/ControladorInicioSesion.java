package controlador;

import modulo.gestorAutenticacion.GestorAutenticacion;
import modulo.gestorAutenticacion.Usuario;
import modulo.gestorConfiguracion.Configuracion;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ControladorInicioSesion")
public class ControladorInicioSesion extends HttpServlet {
    private GestorAutenticacion gestorAutenticacion = new GestorAutenticacion();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("vista/IU_InicioSesion.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String correo = request.getParameter("email");
        String password = request.getParameter("password");

        Usuario usuario = new Usuario(correo,password);
        GestorAutenticacion ga = new GestorAutenticacion();

        if(ga.IniciarSesion(usuario)){
            //Crea sesion
            HttpSession session = request.getSession();
            session.setMaxInactiveInterval(180); //214 HFJS
            //Avisa de exito
            System.out.println("\nExito al iniciar sesion \n");
            request.setAttribute("mensaje", "Usuario inicio sesion exitosa");
            //Consigue información básica de usuario (desde controlador <- gestor -> proxyAuth -> conexion -> BdD)
            usuario = ga.getUsuario(correo);
            //Obtiene configuracion
            Configuracion configuracion = ga.getConfiguracion(Integer.toString(usuario.getId()));
            //Completa objeto sesion (desde controlador(esta clase))
            session.setAttribute("usuario", usuario);
            session.setAttribute("configuracion", configuracion);
            request.getRequestDispatcher("vista/IU_Feed.jsp").forward(request, response);
        } else {
            System.out.println("\nError al iniciar sesion \n");
            request.setAttribute("mensaje", "Usuario no inicio sesion");
            request.getRequestDispatcher("vista/IU_Registrarse.jsp").forward(request, response);
        }
    }
}
