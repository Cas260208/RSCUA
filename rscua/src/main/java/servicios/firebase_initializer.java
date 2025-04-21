package servicios;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.io.InputStream;


public class firebase_initializer  implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        //Agregar manualmente el archivo serviceAccountKey.json en la ruta específicada.
        try (InputStream serviceAccount = sce.getServletContext().getResourceAsStream("/WEB-INF/serviceAccountKey.json")) {

            FirebaseOptions options = FirebaseOptions.builder()
                    .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                    .setDatabaseUrl("https://rscua-79bbf.firebaseio.com")
                    .build();

            FirebaseApp.initializeApp(options);
            System.out.println("✅ Firebase Admin SDK inicializado");
        } catch (Exception e) {
            throw new RuntimeException("Error al inicializar Firebase", e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // opcional: FirebaseApp.getInstance().delete();
    }
}
