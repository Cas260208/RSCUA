package servicios.FeedAF;

public class FeedDispatcher {
    public static Feed obtenerFeed(String tipo) {
        FabricaAbstracta_Feed fabrica;

        switch (tipo.toLowerCase()) {
            case "publicaciones":
                fabrica = new FabricaConcreta_Publicaciones();
                break;
            case "comunidades":
                fabrica = new FabricaConcreta_Comunidades();
                break;
            case "historias":
                fabrica = new FabricaConcreta_Historias();
                break;
            case "videos":
                fabrica = new FabricaConcreta_VidCor();
                break;
            case "sugerencias":
                fabrica = new FabricaConcreta_Sugerencias();
                break;
            default:
                throw new IllegalArgumentException("Tipo de feed no reconocido");
        }

        //feed.mostrar();
        return fabrica.crearFeed();
    }
}
