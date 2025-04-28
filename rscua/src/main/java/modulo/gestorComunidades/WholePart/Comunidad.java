package modulo.gestorComunidades.WholePart;

import java.util.List;

public class Comunidad {
    private int id;
    private String nombre;
    private String descripcion;
    private int miembros;
    private boolean registrado;

    // Whole-Part: componentes
    private List<PublicacionesComunidad> publicaciones;
    private List<MensajesComunidad> mensajes;
    private List<NotificacionesComunidad> notificaciones;

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getMiembros() {
        return miembros;
    }
    public void setMiembros(int miembros) {
        this.miembros = miembros;
    }

    public boolean isRegistrado() {
        return registrado;
    }
    public void setRegistrado(boolean registrado) {
        this.registrado = registrado;
    }

    public List<PublicacionesComunidad> getPublicaciones() {
        return publicaciones;
    }
    public void setPublicaciones(List<PublicacionesComunidad> publicaciones) {
        this.publicaciones = publicaciones;
    }

    public List<MensajesComunidad> getMensajes() {
        return mensajes;
    }
    public void setMensajes(List<MensajesComunidad> mensajes) {
        this.mensajes = mensajes;
    }

    public List<NotificacionesComunidad> getNotificaciones() {
        return notificaciones;
    }
    public void setNotificaciones(List<NotificacionesComunidad> notificaciones) {
        this.notificaciones = notificaciones;
    }
}
