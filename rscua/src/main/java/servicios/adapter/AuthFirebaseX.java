package servicios.adapter;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import com.google.firebase.auth.FirebaseAuthException;

public class AuthFirebaseX {
    public FirebaseToken loginX(String xToken) throws FirebaseAuthException {
        return FirebaseAuth.getInstance().verifyIdToken(xToken);
    }
}