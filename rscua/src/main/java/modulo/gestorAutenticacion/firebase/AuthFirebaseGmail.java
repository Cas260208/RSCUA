package modulo.gestorAutenticacion.firebase;

import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import com.google.firebase.auth.FirebaseAuthException;

public class AuthFirebaseGmail {

    //Llama directamente a la API de Firebase para verificar el idToken.

    public FirebaseToken login(String idToken) throws FirebaseAuthException {
        return FirebaseAuth.getInstance().verifyIdToken(idToken);
    }
}