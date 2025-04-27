package modulo.gestorNotificaciones;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Properties;

/**
 * Fachada/cliente que ensambla la cadena Decorator
 *        Base   → Push → (Mail opcional)
 * y expone un único método para enviar la notificación.
 */
public class GNotificaciones_cliente {

    private final iNotificacion notificador;   // objeto final que usará el resto del sistema

    public GNotificaciones_cliente(HttpServletRequest request) {

        /* 1) Componente base (solo imprime en consola) */
        iNotificacion base = new Notificacion();

        /* 2) Añadimos decorador PUSH (request-scope) */
        iNotificacion push = new DecoradorConcretoPush(base, request);

        /* 3) Intentamos leer credenciales de WEB-INF/mail.properties */
        ServletContext ctx = request.getServletContext();
        Properties cfg     = new Properties();
        try {
            cfg.load(ctx.getResourceAsStream("/WEB-INF/mail.properties"));
        } catch (IOException e) {
            System.err.println("[MAIL] No se pudo leer mail.properties: " + e.getMessage());
        }

        String from = cfg.getProperty("mail.remitente");     // ej. tu-correo@gmail.com
        String pwd  = cfg.getProperty("mail.appPassword");   // contraseña de aplicación
        String to   = cfg.getProperty("mail.destinatario");  // destinatario

        /* 4) Si hay configuración válida añadimos decorador MAIL */
        if (from != null && pwd != null && to != null) {
            this.notificador = new DecoradorConcretoMail(push, from, pwd, to);
        } else {
            this.notificador = push;   // solo push / consola
        }
    }

    /** El controlador/servlet llama a este método. */
    public void procesarEvento(String mensaje) {
        notificador.enviar(mensaje);
    }
}
