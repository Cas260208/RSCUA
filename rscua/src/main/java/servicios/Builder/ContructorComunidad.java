package servicios.Builder;

import modulo.gestorComunidades.SolicitudComunidad;
import modulo.gestorComunidades.WholePart.Comunidad;

public class ContructorComunidad {
    private Comunidad comunidad = new Comunidad();

    public ContructorComunidad(SolicitudComunidad solicitud) {
        this.comunidad.setNombre(solicitud.getNombre());
        this.comunidad.setDescripcion(solicitud.getDescripcion());
        this.comunidad.setMiembros(solicitud.getMiembros());
        this.comunidad.setRegistrado(solicitud.isRegistrado());
    }

    public Comunidad getComunidad(){
        return this.comunidad;
    }

}
