package controlador;

import modulo.gestorAutenticacion.GestorAutenticacion;
import modulo.gestorAutenticacion.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;

@WebServlet("/ControladorRegistrarse")
public class ControladorRegistrarse extends HttpServlet {

    private GestorAutenticacion gestorAutenticacion = new GestorAutenticacion();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("vista/IU_Registrarse.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Capturar los parámetros del formulario
        String nombre = request.getParameter("name");
        String apellido = request.getParameter("lastname");
        String fn = request.getParameter("fn"); // Formato: yyyy-MM-dd
        String sexo = request.getParameter("sex");
        String username = request.getParameter("username");
        String telefono = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validar y convertir fecha
        Date fecnac;
        try {
            fecnac = Date.valueOf(fn);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            request.setAttribute("error", "Fecha de nacimiento inválida.");
            request.getRequestDispatcher("vista/IU_Registrarse.jsp").forward(request, response);
            return;
        }

        // Crear nuevo usuario
        Usuario nuevoUsuario = new Usuario(nombre, apellido, username, telefono, email, password, fecnac, sexo);

        // Registrar usuario
        boolean registrado = gestorAutenticacion.Registrar(nuevoUsuario);

        if (registrado) {
            System.out.println("✅ Usuario registrado correctamente: " + username);
            request.setAttribute("mensaje", "Usuario Creado Exitosamente");
            request.getRequestDispatcher("vista/IU_Registrarse.jsp").forward(request, response);
        } else {
            System.out.println("❌ Fallo al registrar usuario: correo o usuario duplicado.");
            request.setAttribute("error", "Usuario no registrado, revisa tus datos.");
            request.getRequestDispatcher("vista/IU_Registrarse.jsp").forward(request, response);
        }
    }
}