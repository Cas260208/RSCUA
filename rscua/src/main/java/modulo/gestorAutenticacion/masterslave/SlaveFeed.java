package modulo.gestorAutenticacion.masterslave;

import modulo.gestorPublicaciones.Publicaciones;
import servicios.FeedAF.FeedDispatcher;
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
        FeedDispatcher dispatcher = new FeedDispatcher();
        dispatcher.obtenerFeed("publicaciones");
        dispatcher.obtenerFeed("historias");
        dispatcher.obtenerFeed("sugerencias");
        dispatcher.obtenerFeed("videos");
        dispatcher.obtenerFeed("comunidades");
        return proxy.obtenerPublicacionesPerfil(usuarioId);
    }
}