package servicios;

import modulo.gestorPublicaciones.Publicaciones;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.PreparedStatement;

public class ProxyPublicacionesCommand {
    private Conexion conexion;

    public ProxyPublicacionesCommand() throws SQLException {
        this.conexion = new Conexion();
    }

    public boolean crearPublicacion(Publicaciones publicacion) throws SQLException {
        String callSP = "{CALL sp_crear_publicacion(?, ?, ?, ?, ?, ?)}";
        try (CallableStatement cs = conexion.getConexion().prepareCall(callSP)) {
            cs.setInt(1, publicacion.getUsuarioId());
            cs.setString(2, publicacion.getTexto());
            cs.setTimestamp(3, publicacion.getFechaPublicacion());
            cs.setString(4, publicacion.getEtiquetas());
            cs.setString(5, publicacion.getPrivacidad().name().toLowerCase());
            cs.setString(6, publicacion.getImagen());
            return cs.executeUpdate() > 0;
        }
    }

    public boolean eliminarPublicacion(int idPublicacion) throws SQLException {
        // Usamos DELETE directo en vez de llamar al procedure (no se creo jaja)
        String sql = "DELETE FROM publicaciones WHERE id = ?";
        try (PreparedStatement ps = conexion.getConexion().prepareStatement(sql)) {
            ps.setInt(1, idPublicacion);
            return ps.executeUpdate() > 0;
        }
    }

    public boolean editarPublicacion(Publicaciones publicacion) throws SQLException {
        String callSP = "{CALL sp_editar_publicacion(?, ?, ?, ?, ?)}";
        try (CallableStatement cs = conexion.getConexion().prepareCall(callSP)) {
            cs.setInt(1, publicacion.getId());
            cs.setString(2, publicacion.getTexto());
            cs.setString(3, publicacion.getEtiquetas());
            cs.setString(4, publicacion.getPrivacidad().name().toLowerCase());
            cs.setString(5, publicacion.getImagen());
            return cs.executeUpdate() > 0;
        }
    }
}
