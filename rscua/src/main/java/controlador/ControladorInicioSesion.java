package controlador;

import com.google.firebase.auth.FirebaseAuthException;
import com.google.firebase.auth.FirebaseToken;
import servicios.adapter.LoginFirebase;
import servicios.adapter.LoginFirebaseFactory;
import modulo.gestorAutenticacion.GestorAutenticacion;
import modulo.gestorAutenticacion.Usuario;
import modulo.gestorConfiguracion.Configuracion;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/ControladorInicioSesion")
public class ControladorInicioSesion extends HttpServlet {

    private GestorAutenticacion gestorAutenticacion = new GestorAutenticacion();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("vista/IU_InicioSesion.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String idToken = request.getParameter("idToken");
        String provider = request.getParameter("provider");
        if (provider == null) provider = "gmail";

        // 1) Login con Google (Firebase Admin verifica el token)
        if (idToken != null && !idToken.isEmpty()) {
            try {
                //PATRÓN ADAPTER
                //Se obtiene el adapter adecuado
                LoginFirebase loginFirebase = LoginFirebaseFactory.getAdapter(provider);
                //Se autentica y recibe el token decodificado
                FirebaseToken decodedToken = loginFirebase.authenticate(idToken);

                String email = decodedToken.getEmail();

                // 1.1) Intenta cargar al usuario de la BD
                Usuario usuario = gestorAutenticacion.getUsuario(email);

                // 1.2) Si no existe, se registra automáticamente
                if (usuario == null) {
                    boolean creado = gestorAutenticacion.registrarDesdeGoogle(decodedToken);
                    if (!creado) {
                        request.setAttribute("mensaje", "Error al crear usuario desde Google.");
                        request.getRequestDispatcher("vista/IU_InicioSesion.jsp")
                                .forward(request, response);
                        return;
                    }
                    // Vuelve a cargar al usuario recién registrado
                    usuario = gestorAutenticacion.getUsuario(email);
                    if (usuario == null) {
                        request.setAttribute("mensaje", "No se pudo recuperar usuario tras registro.");
                        request.getRequestDispatcher("vista/IU_InicioSesion.jsp")
                                .forward(request, response);
                        return;
                    }
                }

                // 1.3) Ya tiene usuario (existente o recién creado), carga su configuración
                Configuracion cfg = gestorAutenticacion.getConfiguracion(usuario.getId());
                session.setAttribute("usuario", usuario);
                session.setAttribute("configuracion", cfg);

                request.setAttribute("mensaje", "Inicio con Google exitoso");
//                request.getRequestDispatcher("vista/IU_Feed.jsp")
//                        .forward(request, response);
                response.sendRedirect("ControladorFeed");

                return;

            } catch (FirebaseAuthException e) {
                e.printStackTrace();
                request.setAttribute("mensaje", "Error validando token de " + provider);
                request.getRequestDispatcher("vista/IU_InicioSesion.jsp")
                        .forward(request, response);
                return;
            }
        }

        // 2) Login tradicional con email/password
        String correo   = request.getParameter("email");
        String password = request.getParameter("password");
        if (correo.equals("moderadorRSCUA@gmail.com") && password.equals("moderadorRSCUA1")) {
            Usuario moderador = new Usuario(correo, password);
            session.setAttribute("usuario", moderador);
            response.sendRedirect("vista/IU_FeedModerador.jsp");
            return;
        }

        if (correo.equals("administradorRSCUA@gmail.com") && password.equals("administradorRSCUA1")) {
            Usuario admin = new Usuario(correo, password);
            session.setAttribute("usuario", admin);
            response.sendRedirect("vista/IU_FeedAdministrador.jsp");
            return;
        }

        Usuario usuario = new Usuario(correo, password);
        boolean autenticado = gestorAutenticacion.IniciarSesion(usuario);

        if (autenticado) {
            System.out.println("\n✅ Éxito al iniciar sesión");

            usuario = gestorAutenticacion.getUsuario(correo);
            if (usuario == null) {
                System.out.println("⚠️ No se encontró el usuario en la BD");
                request.setAttribute("mensaje", "Error al recuperar usuario.");
                request.getRequestDispatcher("vista/IU_Registrarse.jsp")
                        .forward(request, response);
                return;
            }

            Configuracion configuracion = gestorAutenticacion.getConfiguracion(usuario.getId());
            session.setAttribute("usuario", usuario);
            session.setAttribute("configuracion", configuracion);

            request.setAttribute("mensaje", "Inicio de sesión exitoso");

            //Aqui debe ir el MS Autenticaciön
            //Para cargar la info y mandarla al Controlador Feed

//            request.getRequestDispatcher("vista/IU_Feed.jsp")
//                    .forward(request, response);
            response.sendRedirect("ControladorFeed");

        } else {
            System.out.println("\n❌ Error al iniciar sesión");
            request.setAttribute("mensaje", "Credenciales incorrectas.");
            request.getRequestDispatcher("vista/IU_Registrarse.jsp")
                    .forward(request, response);
        }
    }
}
