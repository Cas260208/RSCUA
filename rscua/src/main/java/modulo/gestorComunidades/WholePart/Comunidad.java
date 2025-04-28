package modulo.gestorComunidades.WholePart;

public class Comunidad {
    private String nombre;
    private String descripcion;
    private int miembros;
    private boolean registrado;

    private PublicacionesComunidad publicaciones;
    private MensajesComunidad mensajes;
    private NotificacionesComunidad notificaciones;

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

}
