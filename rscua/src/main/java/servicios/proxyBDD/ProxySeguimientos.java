package servicios.proxyBDD;

import servicios.Conexion;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class ProxySeguimientos implements ipSeguimientos {
    private final Conexion conexion;

    public ProxySeguimientos() {
        try {
            this.conexion = new Conexion();
        } catch (Exception e) {
            throw new DataAccessException("Error al inicializar ProxySeguimientos", e);
        }
    }


    @Override
    public List<Integer> cargarIdsUsuariosSeguimientos(int UsuarioId) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_cargar_ids_seguimientos(?)}")) {
            cs.setInt(1, UsuarioId);
            try (ResultSet rs = cs.executeQuery()) {
                List<Integer> ids = new ArrayList<>();
                while (rs.next()) {
                    ids.add(rs.getInt("id_usuario_seguido"));
                }
                return ids;
            }
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
    }

    @Override
    public List<String> cargarUsernamesSeguimientos(List<Integer> seguimientosUsuarioIds) {
        String json = "[" + seguimientosUsuarioIds.stream()
                .map(String::valueOf)
                .collect(Collectors.joining(",")) +
                "]";
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_cargar_usernames_seguimientos(?)}")) {
            cs.setString(1, json);
            try (ResultSet rs = cs.executeQuery()) {
                List<String> names = new ArrayList<>();
                while (rs.next()) {
                    names.add(rs.getString("username"));
                }
                return names;
            }
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
    }

    @Override
    public int cargarNumeroSeguidores(int UsuarioId) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_cargar_numero_seguidores(?)}")) {
            cs.setInt(1, UsuarioId);
            try (ResultSet rs = cs.executeQuery()) {
                return rs.next() ? rs.getInt("numero_seguidores") : 0;
            }
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
    }

    @Override
    public int cargarNumeroSeguidos(int UsuarioId) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_cargar_numero_seguidos(?)}")) {
            cs.setInt(1, UsuarioId);
            try (ResultSet rs = cs.executeQuery()) {
                return rs.next() ? rs.getInt("numero_seguidos") : 0;
            }
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
    }

    @Override
    public void agregarSeguidor(int UsuarioId, int UsuarioSeguidorId) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_agregar_seguidor(?,?)}")) {
            cs.setInt(1, UsuarioId);
            cs.setInt(2, UsuarioSeguidorId);
            cs.executeUpdate();
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
    }

    @Override
    public void agregarSeguido(int UsuarioId, int UsuarioSeguidoId) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_agregar_seguido(?,?)}")) {
            cs.setInt(1, UsuarioId);
            cs.setInt(2, UsuarioSeguidoId);
            cs.executeUpdate();
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
    }

    @Override
    public void eliminarSeguidor(int UsuarioId, int UsuarioSeguidorId) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_eliminar_seguidor(?,?)}")) {
            cs.setInt(1, UsuarioId);
            cs.setInt(2, UsuarioSeguidorId);
            cs.executeUpdate();
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
    }

    @Override
    public void eliminarSeguido(int UsuarioId, int UsuarioSeguidoId) {
        try (CallableStatement cs = conexion.getConexion()
                .prepareCall("{CALL sp_eliminar_seguido(?,?)}")) {
            cs.setInt(1, UsuarioId);
            cs.setInt(2, UsuarioSeguidoId);
            cs.executeUpdate();
        } catch (SQLException e) {
            throw new DataAccessException(e);
        }
    }

    @Override
    public void bloquearUsuario(int UsuarioId, int UsuarioBloqueadoId) {
        // no implementado
    }

    @Override
    public void desbloquearUsuario(int UsuarioId, int UsuarioDesbloqueadoId) {
        // no implementado
    }
}
