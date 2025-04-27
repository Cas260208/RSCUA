package modulo.gestorHistorias;

import java.sql.Time;
import java.sql.Timestamp;

public class Historia {

    private int id;
    private String texto;
    private Timestamp fechaPub;
    private String fotourl;
    private int idUsuario;
    private String efecto;

    public Historia(int id, String texto, Timestamp fechaPub, String fotourl, int idUsuario) {
        this.id = id;
        this.texto = texto;
        this.fechaPub = fechaPub;
        this.fotourl = fotourl;
        this.idUsuario = idUsuario;
    }

    public Historia() { }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTexto() {
        return texto;
    }

    public void setTexto(String texto) {
        this.texto = texto;
    }

    public Timestamp getFechaPub() {
        return fechaPub;
    }

    public void setFechaPub(Timestamp fechaPub) {
        this.fechaPub = fechaPub;
    }

    public String getFotourl() {
        return fotourl;
    }

    public void setFotourl(String fotourl) {
        this.fotourl = fotourl;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getEfecto() {
        return efecto;
    }

    public void setEfecto(String efecto) {
        this.efecto = efecto;
    }

    public enum Privacidad {
        Amigos, Privado, Publico
    }
}
