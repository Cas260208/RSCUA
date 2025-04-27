package modulo.gestorNotificaciones;

/**
 * Componente «concreto» de la jerarquía Decorator.
 * Aquí simplemente mostramos por consola.
 */
public class Notificacion implements iNotificacion {

    @Override
    public void enviar(String mensaje) {
        System.out.println("[BASE] Notificación: " + mensaje);
    }
}
