package servicios;

import modulo.gestorPublicaciones.Publicaciones;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProxyPublicacionesQuery {
    private Conexion conexion;

    public ProxyPublicacionesQuery() throws SQLException {
        this.conexion = new Conexion();
    }

    public List<Publicaciones> obtenerPublicacionesPerfil(int usuarioId) throws SQLException {
        String query = "SELECT * FROM publicaciones WHERE usuario_id = ?";
        List<Publicaciones> publicaciones = new ArrayList<>();

        try (PreparedStatement ps = conexion.getConexion().prepareStatement(query)) {
            ps.setInt(1, usuarioId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Publicaciones publicacion = new Publicaciones();
                    publicacion.setId(rs.getInt("id"));
                    publicacion.setUsuarioId(rs.getInt("usuario_id"));
                    publicacion.setTexto(rs.getString("texto"));
                    publicacion.setFechaPublicacion(rs.getTimestamp("fecha_publicacion"));
                    publicacion.setEtiquetas(rs.getString("etiquetas"));
                    publicacion.setPrivacidad(
                            Publicaciones.Privacidad.valueOf(rs.getString("privacidad").toUpperCase())
                    );
                    publicacion.setImagen(rs.getString("imagen"));
                    publicaciones.add(publicacion);
                }
            }
        }
        return publicaciones;
    }
}
