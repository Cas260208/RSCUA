package modulo.gestorSeguimientos;

import servicios.proxyBDD.ProxySeguimientos;
import servicios.proxyBDD.ipSeguimientos;
import servicios.proxyBDD.DataAccessException;

import java.util.List;

public class GestorSeguimientos implements ipSeguimientos {

    private final ProxySeguimientos pSeguimientos;

    public GestorSeguimientos() {
        pSeguimientos = new ProxySeguimientos();
    }

    @Override
    public List<Integer> cargarIdsUsuariosSeguimientos(int UsuarioId) {
        try {
            return pSeguimientos.cargarIdsUsuariosSeguimientos(UsuarioId);
        } catch (DataAccessException e) {
            System.err.println("Error al obtener IDs de seguidos: " + e.getCause());
            return null;
        }
    }

    @Override
    public List<String> cargarUsernamesSeguimientos(List<Integer> seguimientosUsuarioIds) {
        try {
            return pSeguimientos.cargarUsernamesSeguimientos(seguimientosUsuarioIds);
        } catch (DataAccessException e) {
            System.err.println("Error al obtener usernames de seguidos: " + e.getCause());
            return null;
        }
    }

    @Override
    public int cargarNumeroSeguidores(int UsuarioId) {
        try {
            return pSeguimientos.cargarNumeroSeguidores(UsuarioId);
        } catch (DataAccessException e) {
            System.err.println("Error al contar seguidores: " + e.getCause());
            return 0;
        }
    }

    @Override
    public int cargarNumeroSeguidos(int UsuarioId) {
        try {
            return pSeguimientos.cargarNumeroSeguidos(UsuarioId);
        } catch (DataAccessException e) {
            System.err.println("Error al contar seguidos: " + e.getCause());
            return 0;
        }
    }

    @Override
    public void agregarSeguidor(int UsuarioId, int UsuarioSeguidorId) {
        try {
            pSeguimientos.agregarSeguidor(UsuarioId, UsuarioSeguidorId);
        } catch (DataAccessException e) {
            System.err.println("Error al agregar seguidor: " + e.getCause());
        }
    }

    @Override
    public void agregarSeguido(int UsuarioId, int UsuarioSeguidoId) {
        try {
            pSeguimientos.agregarSeguido(UsuarioId, UsuarioSeguidoId);
        } catch (DataAccessException e) {
            System.err.println("Error al agregar seguido: " + e.getCause());
        }
    }

    @Override
    public void eliminarSeguidor(int UsuarioId, int UsuarioSeguidorId) {
        try {
            pSeguimientos.eliminarSeguidor(UsuarioId, UsuarioSeguidorId);
        } catch (DataAccessException e) {
            System.err.println("Error al eliminar seguidor: " + e.getCause());
        }
    }

    @Override
    public void eliminarSeguido(int UsuarioId, int UsuarioSeguidoId) {
        try {
            pSeguimientos.eliminarSeguido(UsuarioId, UsuarioSeguidoId);
        } catch (DataAccessException e) {
            System.err.println("Error al eliminar seguido: " + e.getCause());
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
