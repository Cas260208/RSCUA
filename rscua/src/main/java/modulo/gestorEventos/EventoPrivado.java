package modulo.gestorEventos;

public class EventoPrivado implements TipoEventoImplementador {
    @Override
    public void registrarTipo() {
        System.out.println("Registrando evento tipo Privado");
    }
}
