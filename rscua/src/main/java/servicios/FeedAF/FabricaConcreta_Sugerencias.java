package servicios.FeedAF;

public class FabricaConcreta_Sugerencias extends FabricaAbstracta_Feed {
    @Override
    public Feed crearFeed() {
        return new FeedSugerencias();
    }
}
