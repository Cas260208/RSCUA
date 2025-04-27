package modulo.gestorNotificaciones;

import javax.servlet.http.HttpServletRequest;

/**
 * Simula una notificación *push* enviando el mensaje al
 * request para que el JSP lo pinte.
 */
public class DecoradorConcretoPush extends DecoradorNotificacion {

    private final HttpServletRequest request;

    public DecoradorConcretoPush(iNotificacion envuelto,
                                 HttpServletRequest request) {
        super(envuelto);
        this.request = request;
    }

    @Override
    public void enviar(String mensaje) {
        super.enviar(mensaje);                    // → cadena de responsabilidad
        request.setAttribute("mensajePush", mensaje);
        System.out.println("[PUSH] Mensaje enviado a JSP");
    }
}
