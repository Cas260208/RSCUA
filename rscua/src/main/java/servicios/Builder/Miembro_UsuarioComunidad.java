package servicios.Builder;

public class Miembro_UsuarioComunidad implements InterfazComunidad {
    private String nombreUsuario;

    public Miembro_UsuarioComunidad(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    @Override
    public String getTipoMiembro() {
        return "Usuario de Comunidad";
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }
}
