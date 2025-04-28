package servicios;

import modulo.gestorPublicaciones.Comentario;
import modulo.gestorPublicaciones.Publicaciones;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

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

    /* insertar y devolver id nuevo */
    public int crearComentario(int userId, int pubId, String texto) throws SQLException {
        String call = "{CALL sp_crear_comentario(?,?,?)}";
        try (CallableStatement cs = conexion.getConexion().prepareCall(call)) {
            cs.setInt   (1, userId);
            cs.setInt   (2, pubId);
            cs.setString(3, texto);
            ResultSet rs = cs.executeQuery();
            return rs.next() ? rs.getInt("nuevo_id") : -1;
        }
    }

    /* listar */
    public List<Comentario> listarPorPublicacion(int pubId) throws SQLException {
        List<Comentario> list = new ArrayList<>();
        String call = "{CALL sp_listar_comentarios(?)}";
        try (CallableStatement cs = conexion.getConexion().prepareCall(call)) {
            cs.setInt(1, pubId);
            ResultSet rs = cs.executeQuery();
            while (rs.next()) {
                Comentario c = new Comentario();
                c.setId          (rs.getInt("id"));
                c.setUsuarioId   (rs.getInt("usuario_id"));
                c.setContenido   (rs.getString("contenido"));
                c.setFecha       (rs.getTimestamp("fecha"));
                c.setUsername(rs.getString("username"));
                c.setPublicacionId(pubId);
                list.add(c);
            }
        }
        return list;
    }

}
