package modulo.gestorEventos;

public class EventoGrupal implements TipoEventoImplementador {
    @Override
    public void registrarTipo() {
        System.out.println("Registrando evento tipo Grupal");
    }
}