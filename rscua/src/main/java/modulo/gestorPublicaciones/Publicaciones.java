package modulo.gestorPublicaciones;

import java.sql.Timestamp;

public class Publicaciones implements InterfazPublicacion{

    public enum Privacidad {
        PUBLICO, AMIGOS, PRIVADO
    }
    private int id;
    private int usuarioId;
    private String texto;
    private String imagen;
    private Timestamp fechaPublicacion;
    private String etiquetas;
    private Privacidad privacidad;
    private Integer adminEliminoId;
    private Integer adminModificoId;
    private Timestamp fechaEliminacion;
    private Timestamp fechaModificacion;



    public Publicaciones(int id, int usuarioId, String texto, String imagen, Timestamp fechaPublicacion,
                         String etiquetas, Privacidad privacidad, Integer adminEliminoId, Integer adminModificoId,
                         Timestamp fechaEliminacion, Timestamp fechaModificacion) {
        this.id = id;
        this.usuarioId = usuarioId;
        this.texto = texto;
        this.imagen = imagen;
        this.fechaPublicacion = fechaPublicacion;
        this.etiquetas = etiquetas;
        this.privacidad = privacidad;
        this.adminEliminoId = adminEliminoId;
        this.adminModificoId = adminModificoId;
        this.fechaEliminacion = fechaEliminacion;
        this.fechaModificacion = fechaModificacion;
    }

    // Constructor vacío
    public Publicaciones() {
    }

    // Getters y Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(int usuarioId) {
        this.usuarioId = usuarioId;
    }

    public Timestamp getFechaPublicacion() {
        return fechaPublicacion;
    }

    public void setFechaPublicacion(Timestamp fechaPublicacion) {
        this.fechaPublicacion = fechaPublicacion;
    }

    public String getEtiquetas() {
        return etiquetas;
    }

    public void setEtiquetas(String etiquetas) {
        this.etiquetas = etiquetas;
    }

    public Privacidad getPrivacidad() {
        return privacidad;
    }

    public void setPrivacidad(Privacidad privacidad) {
        this.privacidad = privacidad;
    }

    public Integer getAdminEliminoId() {
        return adminEliminoId;
    }

    public void setAdminEliminoId(Integer adminEliminoId) {
        this.adminEliminoId = adminEliminoId;
    }

    public Integer getAdminModificoId() {
        return adminModificoId;
    }

    public void setAdminModificoId(Integer adminModificoId) {
        this.adminModificoId = adminModificoId;
    }

    public Timestamp getFechaEliminacion() {
        return fechaEliminacion;
    }

    public void setFechaEliminacion(Timestamp fechaEliminacion) {
        this.fechaEliminacion = fechaEliminacion;
    }

    public Timestamp getFechaModificacion() {
        return fechaModificacion;
    }

    public void setFechaModificacion(Timestamp fechaModificacion) {
        this.fechaModificacion = fechaModificacion;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    @Override
    public void dispatch() {
        ProxyPublicaciones proxy = new ProxyPublicaciones(this);
        proxy.dispatch();
    }

    /**
     * Aquí “ensamblamos” y mostramos cada parte (Whole-Part).
     */
    public void realDispatch() {
        System.out.println("[Publicacion] Mostrando contenido:");
        // Parte Descripción
        new Descripcion(texto).mostrar();

        // Parte Multimedia (si existe)
        if (imagen != null && !imagen.isEmpty()) {
            new Multimedia(imagen).mostrar();
        }

        // Parte Configuración
        new ConfiguracionP(privacidad.name().toLowerCase()).mostrar();
    }

}
