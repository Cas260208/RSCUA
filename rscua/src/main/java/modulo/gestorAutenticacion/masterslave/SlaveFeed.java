package modulo.gestorAutenticacion.masterslave;

import modulo.gestorPublicaciones.Publicaciones;
import servicios.ProxyPublicacionesQuery;

import java.sql.SQLException;
import java.util.List;

public class SlaveFeed {
    private final ProxyPublicacionesQuery proxy;

    public SlaveFeed() throws SQLException {
        this.proxy = new ProxyPublicacionesQuery();
    }

    //Consulta el feed del usuario a través del proxy.

    public List<Publicaciones> consultaVerificacionFeed(int usuarioId) throws SQLException {
        return proxy.obtenerPublicacionesPerfil(usuarioId);
    }
}