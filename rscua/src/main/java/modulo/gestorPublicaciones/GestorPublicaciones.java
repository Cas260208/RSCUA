package modulo.gestorPublicaciones;

import servicios.ProxyPublicacionesCommand;
import servicios.ProxyPublicacionesQuery;

import java.sql.SQLException;
import java.util.List;

public class GestorPublicaciones {
    private ProxyPublicacionesCommand proxyPublicacionesCommand;
    private ProxyPublicacionesQuery proxyPublicacionesQuery;

    public GestorPublicaciones() {
        try {
            proxyPublicacionesCommand = new ProxyPublicacionesCommand();
        } catch (SQLException e) {
            System.out.println("Error al inicializar ProxyPublicacionesCommand");
            e.printStackTrace();
        }
        try {
            proxyPublicacionesQuery = new ProxyPublicacionesQuery();
        } catch (SQLException e) {
            System.out.println("Error al inicializar ProxyPublicacionesQuery");
            e.printStackTrace();
        }
    }

    public boolean crearPublicacion(Publicaciones nuevaPublicacion) {
        try {
            return proxyPublicacionesCommand.crearPublicacion(nuevaPublicacion);
        } catch (SQLException e) {
            System.out.println("Error al crear publicación");
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarPublicacion(int idPublicacion) {
        try {
            return proxyPublicacionesCommand.eliminarPublicacion(idPublicacion);
        } catch (SQLException e) {
            System.out.println("Error al eliminar publicación");
            e.printStackTrace();
            return false;
        }
    }

    public List<Publicaciones> obtenerPublicacionesPorUsuario(int usuarioId) {
        try {
            return proxyPublicacionesQuery.obtenerPublicacionesPerfil(usuarioId);
        } catch (SQLException e) {
            System.out.println("Error al obtener publicaciones");
            e.printStackTrace();
            return null;
        }
    }

    public boolean editarPublicacion(Publicaciones publicacionEditada) {
        try {
            return proxyPublicacionesCommand.editarPublicacion(publicacionEditada);
        } catch (SQLException e) {
            System.out.println("Error al editar publicación");
            e.printStackTrace();
            return false;
        }
    }
}