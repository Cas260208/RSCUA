package modulo.gestorAutenticacion.masterslave;

import modulo.gestorNotificaciones.GestorNotificaciones;

import java.sql.SQLException;
import java.util.List;

public class SlaveNotificaciones {
    //private final ProxyNotificacionesQuery proxy;  // debes implementarlo
    //private List<Mensaje> mensajesRecibidos;
    //private List<Comentarios> comentariosRecibidos;
    //private List<Seguimiento> seguimientosRecibidos;
    private final GestorNotificaciones gestorNotificaciones;

    public SlaveNotificaciones() throws SQLException {
        this.gestorNotificaciones = new GestorNotificaciones();
        //gestorNotificaciones.obtenerNotificacionesMensajes(idUsuario);
        //gestorNotificaciones.obtenerNotificacionesSeguimientos(idUsuario);
        //gestorNotificaciones.obtenerNotificacionesComentarios(idUsuario);

        //this.proxy = new ProxyNotificacionesQuery();
    }

     // Consulta las notificaciones del usuario.

    //public List<Notificacion> consultaVerificacionNotificaciones(int usuarioId) throws SQLException {
       // return proxy.obtenerNotificaciones(usuarioId);
    //}
}