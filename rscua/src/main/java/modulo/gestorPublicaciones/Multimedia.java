package modulo.gestorPublicaciones;


public class Multimedia {
    private final String ruta;

    public Multimedia(String ruta) {
        this.ruta = ruta;
    }

    public void mostrar() {
        System.out.println("Multimedia (imagen) en: " + ruta);
    }
}