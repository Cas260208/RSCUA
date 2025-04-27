package servicios.FeedAF;

public class FabricaConcreta_VidCor extends FabricaAbstracta_Feed {
    @Override
    public Feed crearFeed() {
        return new FeedVidCor();
    }
}
