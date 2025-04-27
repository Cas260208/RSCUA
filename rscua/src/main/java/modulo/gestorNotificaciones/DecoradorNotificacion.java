package modulo.gestorNotificaciones;

/**
 * Decorador «abstracto».
 * Delegamos la llamada al componente envuelto y dejamos
 * a los decoradores concretos que añadan su comportamiento.
 */
public abstract class DecoradorNotificacion implements iNotificacion {

    protected final iNotificacion envuelto;

    protected DecoradorNotificacion(iNotificacion envuelto) {
        this.envuelto = envuelto;
    }

    @Override
    public void enviar(String mensaje) {
        envuelto.enviar(mensaje);     // comportamiento base
    }
}
