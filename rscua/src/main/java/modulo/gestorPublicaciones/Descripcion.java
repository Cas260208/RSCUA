package modulo.gestorPublicaciones;

public class Descripcion {
    private final String texto;

    public Descripcion(String texto) {
        this.texto = texto;
    }

    public void mostrar() {
        System.out.println("Descripción: " + texto);
    }
}