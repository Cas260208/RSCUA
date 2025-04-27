package modulo.gestorEventos;

public abstract class Evento {
    protected TipoEventoImplementador tipoEvento;

    public Evento(TipoEventoImplementador tipoEvento) {
        this.tipoEvento = tipoEvento;
    }

    public abstract void registrar();
}
