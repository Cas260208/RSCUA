package servicios.proxyBDD;

import java.util.List;

public interface ipSeguimientos {

    public List<Integer> cargarIdsUsuariosSeguidores(int UsuarioId);

    public List<Integer> cargarIdsUsuariosSeguidos(int UsuarioId);

    public List<String> cargarUsernamesSeguidores(int UsuarioId);

    public List<String> cargarUsernamesSeguidos(int UsuarioId);

    public int cargarNumeroSeguidores(int UsuarioId);

    public int cargarNumeroSeguidos(int UsuarioId);

    // si existe la duda, seguimientos predeterminados es inutil
    // porque tabla usuario tiene num seguidores/os con 0,
    // y tabla seguimientos es una lista cuando tienes seguimientos
    // pero un usuario nuevo no puede, hasta que siga o lo sigan, que no es con una cuenta recién hecha o nueva.

    public void agregarSeguidor(int UsuarioId, int UsuarioSeguidorId);

    public void agregarSeguido(int UsuarioId, int UsuarioSeguidoId);

    public void eliminarSeguidor(int UsuarioId, int UsuarioSeguidorId);

    public void eliminarSeguido(int UsuarioId, int UsuarioSeguidoId);

    public void bloquearUsuario(int UsuarioId, int UsuarioBloqueadoId);

    public void desbloquearUsuario(int UsuarioId, int UsuarioDesbloqueadoId);

}
