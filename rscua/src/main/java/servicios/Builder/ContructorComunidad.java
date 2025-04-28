package servicios.Builder;

import modulo.gestorComunidades.SolicitudComunidad;
import modulo.gestorComunidades.WholePart.*;
import java.util.ArrayList;
import java.util.List;

public class ContructorComunidad {
    private Comunidad comunidad = new Comunidad();
    private List<Miembro_UsuarioComunidad> miembros = new ArrayList<>();

    public ContructorComunidad(SolicitudComunidad solicitud) {
        this.comunidad.setNombre(solicitud.getNombre());
        this.comunidad.setDescripcion(solicitud.getDescripcion());
        this.comunidad.setMiembros(solicitud.getMiembros());
        this.comunidad.setRegistrado(solicitud.isRegistrado());
    }

    // Método para agregar un usuario común
    public ContructorComunidad agregarUsuario(Miembro_UsuarioComunidad usuario) {
        this.miembros.add(usuario);
        return this;
    }

    // Método para agregar un moderador
    public ContructorComunidad agregarModerador(Miembro_ModeradorComunidad moderador) {
        this.miembros.add(moderador);
        return this;
    }

    // Método para construir la comunidad
    public Comunidad build() {
        this.comunidad.setMiembros(this.miembros.size());
        return this.comunidad;
    }
}
