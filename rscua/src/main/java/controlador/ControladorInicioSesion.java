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

        Usuario usuario = new Usuario(correo, password);
        GestorAutenticacion ga = new GestorAutenticacion();

        if (ga.IniciarSesion(usuario)) {
            HttpSession session = request.getSession();
            //session.setMaxInactiveInterval(180);

            System.out.println("\n✅ Éxito al iniciar sesión");

            usuario = ga.getUsuario(correo);
            if (usuario == null) {
                System.out.println("⚠️ No se encontró el usuario en la BD");
                request.setAttribute("mensaje", "Error al recuperar usuario.");
                request.getRequestDispatcher("vista/IU_Registrarse.jsp").forward(request, response);
                return;
            }

            //Configuracion configuracion = ga.getConfiguracion(correo);
            Configuracion configuracion = ga.getConfiguracion(usuario.getId());


            session.setAttribute("usuario", usuario);
            session.setAttribute("configuracion", configuracion);

            request.setAttribute("mensaje", "Inicio de sesión exitoso");
            request.getRequestDispatcher("vista/IU_Feed.jsp").forward(request, response);
        } else {
            System.out.println("\n❌ Error al iniciar sesión");
            request.setAttribute("mensaje", "Credenciales incorrectas.");
            request.getRequestDispatcher("vista/IU_Registrarse.jsp").forward(request, response);
        }
    }
}

