package servicios.adapter;

import com.google.firebase.auth.FirebaseToken;
import com.google.firebase.auth.FirebaseAuthException;

public class AdapterFirebaseX implements LoginFirebase {
    private final AuthFirebaseX auth;

    public AdapterFirebaseX() {
        this.auth = new AuthFirebaseX();
    }

    @Override
    public FirebaseToken authenticate(String idToken) throws FirebaseAuthException {
        return auth.loginX(idToken);
    }
}