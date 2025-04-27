package servicios.proxyBDD;

import servicios.Conexion;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProxySeguimientos implements ipSeguimientos {

    private final Conexion conexion;

    public ProxySeguimientos() {
        try {
            this.conexion = new Conexion();
        } catch (Exception e) {
            throw new DataAccessException("Error al inicializar ProxySeguimientos", e);
        }
    }

    // ───────── Listas de IDs ─────────
    @Override
    public List<Integer> cargarIdsUsuariosSeguidores(int usuarioId) {
        List<Integer> ids = new ArrayList<>();
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_cargar_ids_seguidores(?)}")) {
            cs.setInt(1, usuarioId);
            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    // ← esta columna SÍ se llama id_usuario_seguidor
                    ids.add(rs.getInt("usuario_id"));
                }
            }
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
        return ids;
    }

    @Override
    public List<Integer> cargarIdsUsuariosSeguidos(int usuarioId) {
        List<Integer> ids = new ArrayList<>();
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_cargar_ids_seguidos(?)}")) {
            cs.setInt(1, usuarioId);
            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    // ← aquí había que usar id_usuario_seguido
                    ids.add(rs.getInt("usuario_id"));
                }
            }
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
        return ids;
    }


    /* ─────────────  LISTAS DE USERNAMES  ───────────── */

    @Override
    public List<String> cargarUsernamesSeguidores(int usuarioId) {
        List<String> names = new ArrayList<>();
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_cargar_usernames_seguidores(?)}")) {
            cs.setInt(1, usuarioId);
            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    names.add(rs.getString("username"));
                }
            }
            return names;
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
    }

    @Override
    public List<String> cargarUsernamesSeguidos(int usuarioId) {
        List<String> names = new ArrayList<>();
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_cargar_usernames_seguidos(?)}")) {
            cs.setInt(1, usuarioId);
            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    names.add(rs.getString("username"));
                }
            }
            return names;
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
    }

    /* ─────────────  CONTADORES  ───────────── */

    @Override
    public int cargarNumeroSeguidores(int usuarioId) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_cargar_numero_seguidores(?)}")) {
            cs.setInt(1, usuarioId);
            try (ResultSet rs = cs.executeQuery()) {
                return rs.next() ? rs.getInt("numero_seguidores") : 0;
            }
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
    }

    @Override
    public int cargarNumeroSeguidos(int usuarioId) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_cargar_numero_seguidos(?)}")) {
            cs.setInt(1, usuarioId);
            try (ResultSet rs = cs.executeQuery()) {
                return rs.next() ? rs.getInt("numero_seguidos") : 0;
            }
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
    }

    /* ─────────────  OPERACIONES SEGUIR/DEJAR DE SEGUIR  ───────────── */

    @Override
    public void agregarSeguidor(int usuarioId, int usuarioSeguidorId) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_agregar_seguidor(?,?)}")) {
            cs.setInt(1, usuarioId);
            cs.setInt(2, usuarioSeguidorId);
            cs.executeUpdate();
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
    }

    @Override
    public void agregarSeguido(int usuarioId, int usuarioSeguidoId) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_agregar_seguido(?,?)}")) {
            cs.setInt(1, usuarioId);
            cs.setInt(2, usuarioSeguidoId);
            cs.executeUpdate();
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
    }

    @Override
    public void eliminarSeguidor(int usuarioId, int usuarioSeguidorId) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_eliminar_seguidor(?,?)}")) {
            cs.setInt(1, usuarioId);
            cs.setInt(2, usuarioSeguidorId);
            cs.executeUpdate();
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
    }

    @Override
    public void eliminarSeguido(int usuarioId, int usuarioSeguidoId) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_eliminar_seguido(?,?)}")) {
            cs.setInt(1, usuarioId);
            cs.setInt(2, usuarioSeguidoId);
            cs.executeUpdate();
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
    }

    /* ─────────────  NO IMPLEMENTADO  ───────────── */

    @Override public void bloquearUsuario (int u, int b) { /* N/I */ }
    @Override public void desbloquearUsuario(int u, int b) { /* N/I */ }
}
