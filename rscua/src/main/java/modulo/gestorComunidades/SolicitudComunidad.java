package modulo.gestorComunidades;

public class SolicitudComunidad {
    private int id;
    private String nombre;
    private String descripcion;
    private int miembros;
    private boolean registrado;

    // Constructor vacío
    public SolicitudComunidad() {}

    // Constructor con todos los campos
    public SolicitudComunidad(int id, String nombre, String descripcion, int miembros, boolean registrado) {
        this.id = id;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.miembros = miembros;
        this.registrado = registrado;
    }

    // Getters y Setters
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
}