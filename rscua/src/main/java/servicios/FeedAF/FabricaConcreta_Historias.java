package servicios.FeedAF;

public class FabricaConcreta_Historias extends FabricaAbstracta_Feed {
    @Override
    public Feed crearFeed() {
        return new FeedHistorias();
    }
}
