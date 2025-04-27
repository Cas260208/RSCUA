package modulo.gestorEventos;

public class EventoSingular implements TipoEventoImplementador {
    @Override
    public void registrarTipo() {
        System.out.println("Registrando evento tipo Singular");
    }
}
