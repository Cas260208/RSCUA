package servicios.FeedAF;

public class FabricaConcreta_Publicaciones extends FabricaAbstracta_Feed {
    @Override
    public Feed crearFeed() {
        return new FeedPublicaciones();
    }
}
