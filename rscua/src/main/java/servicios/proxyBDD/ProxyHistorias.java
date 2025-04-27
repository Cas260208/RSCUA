package servicios.proxyBDD;

import modulo.gestorHistorias.Historia;
import modulo.gestorHistorias.Reaccion;
import servicios.Conexion;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProxyHistorias implements ipHistorias {
    private final Conexion conexion;

    public ProxyHistorias() {
        try {
            this.conexion = new Conexion();
        } catch (Exception e) {
            throw new DataAccessException("Error al inicializar ProxyHistorias", e);
        }
    }

    @Override
    public Historia cargarHistoria(int id) {
        try (PreparedStatement ps = conexion.getConexion()
                .prepareStatement("CALL sp_cargar_historia(?)")) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Historia h = new Historia();
                    h.setId(rs.getInt("id"));
                    h.setEfecto("Cálido");
                    h.setTexto(rs.getString("texto"));
                    h.setFechaPub(rs.getTimestamp("hora"));
                    h.setFotourl(rs.getString("foto_url"));
                    h.setIdUsuario(rs.getInt("id_usuario"));
                    return h;
                }
            }
        } catch (SQLException e) {
            throw new DataAccessException("Error al cargar historia", e);
        }
        return null;
    }

    @Override
    public boolean publicarHistoria(Historia historia) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_crear_historia(?,?,?,?,?)}")) {
            cs.setString(1, "Cálido"); //efecto por defecto mientras no se modifica BDD, CAMBIAR!!!!!
            cs.setString(2, historia.getTexto());
            cs.setTimestamp(3, new java.sql.Timestamp(historia.getFechaPub().getTime()));
            cs.setString(4, historia.getFotourl());
            cs.setInt(5, historia.getIdUsuario());
            return cs.executeUpdate() > 0;
        } catch (SQLException e) {
            throw new DataAccessException("Error al crear historia", e);
        }
    }

    @Override
    public void editarHistoria(int id, Historia historia) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_editar_historia(?,?,?,?,?)}")) {
            cs.setInt(1, id);
            cs.setString(2, "Cálido");
            cs.setString(3, historia.getTexto());
            cs.setTimestamp(4, new java.sql.Timestamp(historia.getFechaPub().getTime()));
            cs.setString(5, historia.getFotourl());
            cs.executeUpdate();
        } catch (SQLException e) {
            throw new DataAccessException("Error al editar historia", e);
        }
    }

    @Override
    public void eliminarHistoria(int id) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_eliminar_historia(?)}")) {
            cs.setInt(1, id);
            cs.executeUpdate();
        } catch (SQLException e) {
            throw new DataAccessException("Error al eliminar historia", e);
        }
    }

    @Override //Talvez se implementa
    public void reaccionarHistoria(int id, Reaccion reaccion) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_reaccionar_historia(?,?,?)}")) {
            cs.setInt(1, id);
            cs.setInt(2, reaccion.getIdUsuario());
            cs.setString(3, reaccion.getTipo());
            cs.executeUpdate();
        } catch (SQLException e) {
            throw new DataAccessException("Error al reaccionar historia", e);
        }
    }

    @Override
    public void eliminarReaccion(int idReaccion) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_eliminar_reaccion_historia(?)}")) {
            cs.setInt(1, idReaccion);
            cs.executeUpdate();
        } catch (SQLException e) {
            throw new DataAccessException("Error al eliminar reacción de historia", e);
        }
    }
}
