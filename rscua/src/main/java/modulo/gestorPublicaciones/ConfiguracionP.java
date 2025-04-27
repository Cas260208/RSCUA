package modulo.gestorPublicaciones;

public class ConfiguracionP {
    private final String privacidad;

    public ConfiguracionP(String privacidad) {
        this.privacidad = privacidad;
    }

    public void mostrar() {
        System.out.println("Privacidad de la publicación: " + privacidad);
    }
}