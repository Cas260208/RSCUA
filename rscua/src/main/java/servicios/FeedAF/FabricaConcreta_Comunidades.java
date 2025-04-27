package servicios.FeedAF;

public class FabricaConcreta_Comunidades extends FabricaAbstracta_Feed {
    @Override
    public Feed crearFeed() {
        return new FeedComunidades();
    }
}
