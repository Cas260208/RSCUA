package modulo.gestorAutenticacion.masterslave;
import modulo.gestorAutenticacion.Usuario;
import modulo.gestorPublicaciones.Publicaciones;

import java.sql.SQLException;
import java.util.List;

public class MasterUsuario {


    // Despacha la carga del Feed.

    public List<Publicaciones> ejecucionFeed(int usuarioId) throws SQLException {
        SlaveFeed slave = new SlaveFeed();
        return slave.consultaVerificacionFeed(usuarioId);
    }


//    public List<Notificacion> ejecucionNotificaciones(int usuarioId) throws SQLException {
//        SlaveNotificaciones slave = new SlaveNotificaciones();
//        return slave.consultaVerificacionNotificaciones(usuarioId);
//    }


//    public PerfilDTO ejecucionPerfil(Usuario sesionUsuario) {
//        SlavePerfil slave = new SlavePerfil();
//        return slave.consultaVerificacionPerfil(sesionUsuario);
//    }


}