package modulo.gestorAutenticacion;

import modulo.gestorConfiguracion.Configuracion;
import servicios.ProxyAutenticacion;
import com.google.firebase.auth.FirebaseToken;
import java.util.UUID;
import java.sql.Date;
import java.time.LocalDate;



import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GestorAutenticacion {
    private ProxyAutenticacion pAutenticacion;

    public GestorAutenticacion(){
        try {
            pAutenticacion = new ProxyAutenticacion();
        }catch(SQLException e){
            System.out.println("\n\nError al usar proxy autenticacion para crear constructor\n\n");
            e.printStackTrace();
        }
    }

    public boolean Registrar(Usuario nuevoUsuario) {
        try {
             return pAutenticacion.registrar(nuevoUsuario);
        } catch (SQLException e) {
            System.out.println("\n\nError al registrar usuario\n\n");
            e.printStackTrace();
            return false;
        }
    }

    public boolean IniciarSesion(Usuario usuario) {
        return  pAutenticacion.verificarLogin(usuario.getEmail(), usuario.getPassword());
    }

    public Usuario getUsuario(String correo) {
        try {
            return pAutenticacion.obtenerUsuario(correo);
        } catch (SQLException e) {
            System.out.println("\n\nError al obtener usuario\n\n");
            e.printStackTrace();
            return null;
        }
    }

    public Configuracion getConfiguracion(int usuarioId) {
        try {
            return pAutenticacion.obtenerConfiguracion(usuarioId);
        } catch (SQLException e) {
            System.out.println("\n\nError al obtener configuración de usuario\n\n");
            e.printStackTrace();
            return null;
        }
    }
    /**
     * Registra un usuario automáticamente a partir de un FirebaseToken de Google.
     * Si ya existe un usuario con ese correo, devuelve true sin volver a crear.  generando un 'phone' único para no violar la clave UNIQUE de la BD.
     */
    public boolean registrarDesdeGoogle(FirebaseToken token) {
        String email    = token.getEmail();
        String fullName = token.getName() != null ? token.getName() : "";
        String[] parts  = fullName.split(" ", 2);
        String nombre   = parts.length > 0 ? parts[0] : "";
        String apellido = parts.length > 1 ? parts[1] : "";

        // Si ya existe, salimos
        if (getUsuario(email) != null) {
            return true;
        }

        // Genera un phone único para no chocar con UNIQUE
        String phone = String.valueOf(Math.abs(email.hashCode()));

        // Calcula una fecha de nacimiento válida (>= 18 años)
        LocalDate threshold = LocalDate.now().minusYears(18).minusDays(1);
        Date fecnac = Date.valueOf(threshold);

        // Resto de campos
        String username = email;
        String password = UUID.randomUUID().toString();
        String sexo     = "Masculino"; // o "Femenino"

        // Crea el usuario con constructor que espera (nombre, apellido, username, phone, email, password, fecnac, sexo)
        Usuario nuevo = new Usuario(
                nombre,
                apellido,
                username,
                phone,
                email,
                password,
                fecnac,
                sexo
        );

        // Se llama al registro
        return Registrar(nuevo);
    }
}
