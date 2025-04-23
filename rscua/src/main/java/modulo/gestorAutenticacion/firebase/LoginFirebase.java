package modulo.gestorAutenticacion.firebase;

import com.google.firebase.auth.FirebaseToken;
import com.google.firebase.auth.FirebaseAuthException;

public interface LoginFirebase {

    //  Autentica un idToken de Firebase y devuelve el FirebaseToken decodificado.
    FirebaseToken authenticate(String idToken) throws FirebaseAuthException;
}