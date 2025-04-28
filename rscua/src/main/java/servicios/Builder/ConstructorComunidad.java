package servicios.Builder;

import modulo.gestorComunidades.SolicitudComunidad;
import modulo.gestorComunidades.WholePart.Comunidad;

public class ConstructorComunidad {
    private Comunidad comunidad;

    public ConstructorComunidad(SolicitudComunidad solicitud) {
        this.comunidad = new Comunidad();
        comunidad.setId(solicitud.getId());
        comunidad.setNombre(solicitud.getNombre());
        comunidad.setDescripcion(solicitud.getDescripcion());
        comunidad.setMiembros(solicitud.getMiembros());
        comunidad.setRegistrado(solicitud.isRegistrado());
    }

    public Comunidad build() {
        return comunidad;
    }
}