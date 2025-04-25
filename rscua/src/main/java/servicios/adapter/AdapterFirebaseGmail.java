package modulo.gestorAutenticacion.adapter;

import com.google.firebase.auth.FirebaseToken;
import com.google.firebase.auth.FirebaseAuthException;

public class AdapterFirebaseGmail implements LoginFirebase {
    private final AuthFirebaseGmail auth;

    public AdapterFirebaseGmail() {
        this.auth = new AuthFirebaseGmail();
    }

    @Override
    public FirebaseToken authenticate(String idToken) throws FirebaseAuthException {
        //aquí delegamos en la clase concreta
        return auth.login(idToken);
    }
}