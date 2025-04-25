package servicios.adapter;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import com.google.firebase.auth.FirebaseAuthException;

public class AuthFirebaseFB {
    public FirebaseToken loginFB(String fbToken) throws FirebaseAuthException {
        return FirebaseAuth.getInstance().verifyIdToken(fbToken);
    }
}