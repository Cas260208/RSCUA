package servicios.adapter;

import com.google.firebase.auth.FirebaseToken;
import com.google.firebase.auth.FirebaseAuthException;

public class AdapterFirebaseFB implements LoginFirebase {
    private final AuthFirebaseFB auth;

    public AdapterFirebaseFB() {
        this.auth = new AuthFirebaseFB();
    }

    @Override
    public FirebaseToken authenticate(String idToken) throws FirebaseAuthException {
        return auth.loginFB(idToken);
    }
}