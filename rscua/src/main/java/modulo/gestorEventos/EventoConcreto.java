package modulo.gestorEventos;

public class EventoConcreto extends Evento {
    private String titulo;
    private String fecha;
    private String ubicacion;
    private String categoria;
    private String descripcion;
    private String media;

    public EventoConcreto(TipoEventoImplementador tipoEvento, String titulo, String fecha, String ubicacion, String categoria, String descripcion, String media) {
        super(tipoEvento);
        this.titulo = titulo;
        this.fecha = fecha;
        this.ubicacion = ubicacion;
        this.categoria = categoria;
        this.descripcion = descripcion;
        this.media = media;
    }

    @Override
    public void registrar() {
        tipoEvento.registrarTipo();
        // Aquí podrías conectar a MySQL (gestor DAO o similar)
        System.out.println("Registrando evento: " + titulo + ", " + fecha + ", " + ubicacion);
    }
}
