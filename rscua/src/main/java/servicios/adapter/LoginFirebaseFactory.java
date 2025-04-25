package servicios.adapter;

public class LoginFirebaseFactory {
    private LoginFirebaseFactory() { }
     //Devuelve el adapter según el nombre del proveedor:
     //"gmail", "facebook" o "x".
    public static LoginFirebase getAdapter(String provider) {
        switch(provider.toLowerCase()) {
            case "gmail":
                return new AdapterFirebaseGmail();
            case "facebook":
                return new AdapterFirebaseFB();
            case "x":
                return new AdapterFirebaseX();
            default:
                throw new IllegalArgumentException("Proveedor desconocido: " + provider);
        }
    }
}