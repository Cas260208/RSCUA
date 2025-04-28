package servicios.Builder;

public class Miembro_ModeradorComunidad implements InterfazComunidad {
    private String nombreModerador;

    public Miembro_ModeradorComunidad(String nombreModerador) {
        this.nombreModerador = nombreModerador;
    }

    @Override
    public String getTipoMiembro() {
        return "Moderador de Comunidad";
    }

    public String getNombreModerador() {
        return nombreModerador;
    }

    public void setNombreModerador(String nombreModerador) {
        this.nombreModerador = nombreModerador;
    }
}