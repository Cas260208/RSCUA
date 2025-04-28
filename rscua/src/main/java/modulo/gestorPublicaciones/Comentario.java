package modulo.gestorPublicaciones;

import java.sql.Timestamp;

public class Comentario {
    private int id;
    private int usuarioId;
    private String username; //del comentador
    private int publicacionId;
    private String contenido;
    private Timestamp fecha;

    public Comentario() {
    }

    public Comentario(int id, int usuarioId, int publicacionId, String contenido, Timestamp fecha) {
        this.id = id;
        this.usuarioId = usuarioId;
        this.publicacionId = publicacionId;
        this.contenido = contenido;
        this.fecha = fecha;
    }

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

    public String getUsername() {
        return username;
    }

    public int getPublicacionId() {
        return publicacionId;
    }

    public void setPublicacionId(int publicacionId) {
        this.publicacionId = publicacionId;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Timestamp getFecha() {
        return fecha;
    }

    public void setFecha(Timestamp fecha) {
        this.fecha = fecha;
    }

    public void setUsername(String username) {
    }
}
