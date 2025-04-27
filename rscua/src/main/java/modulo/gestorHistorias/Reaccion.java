package modulo.gestorHistorias;

public class Reaccion {
    private int idReaccion;
    private ReaccionEnum reaccion;
    private int idUsuario;
    private int idHistoria;
    private String tipo;

    public int getIdReaccion() {
        return idReaccion;
    }

    public void setIdReaccion(int idReaccion) {
        this.idReaccion = idReaccion;
    }

    public ReaccionEnum getReaccion() {
        return reaccion;
    }

    public void setReaccion(ReaccionEnum reaccion) {
        this.reaccion = reaccion;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdHistoria() {
        return idHistoria;
    }

    public void setIdHistoria(int idHistoria) {
        this.idHistoria = idHistoria;
    }

    public String getTipo() {
        this.tipo = reaccion.name();
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
        //this.tipo = reaccion.name(); name() obtiene el string de un enum
    }

    //pendiente si fuera a implementarse para notificaciones talvez
}
