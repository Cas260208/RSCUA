package modulo.gestorPublicaciones;

public class ProxyPublicaciones implements InterfazPublicacion {
    private final Publicaciones publicacionReal;

    public ProxyPublicaciones(Publicaciones publicacionReal) {
        this.publicacionReal = publicacionReal;
    }

    @Override
    public void dispatch() {
        System.out.println("[ProxyPublicaciones] Iniciando despacho de la publicación...");
        publicacionReal.realDispatch();
    }
}