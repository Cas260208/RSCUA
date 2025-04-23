package modulo.gestorAutenticacion.masterslave;


import modulo.gestorAutenticacion.Usuario;

//Punto de entrada del patrón Master–Slave.
//Recibe el modelo (Usuario) y despacha al MasterUsuario.
public class Autenticacion {
    private final MasterUsuario master;

    public Autenticacion() {
        this.master = new MasterUsuario();
    }


     //Devuelve la instancia de MasterUsuario para poder invocar
     //los métodos de carga de Feed, Notificaciones o Perfil.


    public MasterUsuario dispatch(Usuario usuario) {
        //Se podría validar roles, permisos, logging, etc.
        return master;
    }
}
