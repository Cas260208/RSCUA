package modulo.gestorAutenticacion;

import modulo.gestorConfiguracion.Configuracion;
import servicios.ProxyAutenticacion;

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
}
