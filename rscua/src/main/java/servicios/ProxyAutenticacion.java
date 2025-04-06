package servicios;

import modulo.gestorAutenticacion.Usuario;
import modulo.gestorConfiguracion.Configuracion;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProxyAutenticacion {
    private Conexion conexion;

    public ProxyAutenticacion() throws SQLException {
        this.conexion = new Conexion();
    }

    // Se elimina el metodo existeCorreoTelefonoOUsername y se reemplaza por el siguiente:
    public boolean validarUsuario(String email, String phone, String username, java.sql.Date fechaNacimiento) {
        String callSP = "{CALL sp_validar_usuario(?,?,?,?)}";
        try (CallableStatement cs = conexion.getConexion().prepareCall(callSP)) {
            cs.setString(1, email);
            cs.setString(2, username);
            cs.setString(3, phone);
            cs.setDate(4, fechaNacimiento);
            cs.execute();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error en validación del usuario: " + ex.getMessage());
            ex.printStackTrace();
            return false;
        }
    }


    public boolean registrar(Usuario nU) throws SQLException {
        // Primero se valida el usuario; si falla, se aborta el registro.
        if (!validarUsuario(nU.getEmail(), nU.getPhone(), nU.getUsername(), nU.getFecnac())) {
            System.out.println("Validación fallida (edad menor de 18 o credenciales duplicadas).");
            return false;
        }

        // Se invoca el procedimiento almacenado sp_registrar_usuario
        String callSP = "{CALL sp_registrar_usuario(?,?,?,?,?,?,?,?,?)}";
        try (CallableStatement cs = conexion.getConexion().prepareCall(callSP)) {
            cs.setString(1, nU.getEmail());
            cs.setString(2, nU.getPhone());
            cs.setString(3, nU.getUsername());
            cs.setString(4, nU.getNombre());
            cs.setString(5, nU.getApellido());
            cs.setString(6, nU.getPassword());
            cs.setDate(7, nU.getFecnac());  // p_fechaNacimiento como java.sql.Date
            String sexo = ((Usuario.Sexo) nU.getSexo()).name();
            cs.setString(8, sexo);
            cs.setString(9, null);  // Se envía null y se resuelve luego

            boolean hadResults = cs.execute();
            if (hadResults) {
                try (ResultSet rs = cs.getResultSet()) {
                    if (rs.next()) {
                        int nuevoId = rs.getInt("usuario_registrado");
                        return nuevoId > 0;
                    }
                }
            }
        }
        return false;
    }


    public boolean verificarLogin(String correo, String password) {
        String query = "SELECT * FROM usuario WHERE correo = ? AND contrasenia = ?";
        try (PreparedStatement ps = conexion.getConexion().prepareStatement(query)) {
            ps.setString(1, correo);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            } catch (SQLException rsEx) {
                System.err.println("Error de Query: " + rsEx.getMessage());
                rsEx.printStackTrace();
                return false;
            }
        } catch (SQLException psEx) {
            System.err.println("Error Prepared Statement o Conexion: " + psEx.getMessage());
            psEx.printStackTrace();
            return false;
        }
    }


    public Usuario obtenerUsuario(String correo) throws SQLException {
        Usuario usuario = null;
        String query = "SELECT * FROM usuario WHERE correo = ?";

        try (PreparedStatement ps = conexion.getConexion().prepareStatement(query)) {
            ps.setString(1, correo);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int id = rs.getInt("id");
                    String email = rs.getString("correo");
                    String phone = rs.getString("numTelefono");
                    String username = rs.getString("nombreUsuario");
                    String nombre = rs.getString("nombrePersonal");
                    String apellido = rs.getString("apellido");
                    String contrasenia = rs.getString("contrasenia");
                    java.sql.Date fecnac = rs.getDate("fechaNacimiento");
                    String sexo = rs.getString("sexo");

                    usuario = new Usuario(id, nombre, apellido, username, phone, email, contrasenia, fecnac, sexo);
                }
            } catch (SQLException rsEx) {
                System.err.println("Error al ejecutar la consulta: " + rsEx.getMessage());
                rsEx.printStackTrace();
                return null;
            }
        } catch (SQLException psEx) {
            System.err.println("Error en la preparación de la consulta o en la conexión: " + psEx.getMessage());
            psEx.printStackTrace();
        }
        return usuario;
    }

    public Configuracion obtenerConfiguracion(int usuarioId) throws SQLException {
        Configuracion config = null;
        String query = "SELECT * FROM configuracion WHERE usuario_id = ?";
        try (PreparedStatement ps = conexion.getConexion().prepareStatement(query)) {
            ps.setInt(1, usuarioId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String idiomaStr = rs.getString("idioma");
                    String privacidadStr = rs.getString("privacidad");
                    String temaStr = rs.getString("tema");

                    Configuracion.Privacidad privacidad = Configuracion.Privacidad.valueOf(privacidadStr.toUpperCase());
                    Configuracion.Tema tema = Configuracion.Tema.valueOf(temaStr.toUpperCase());

                    config = new Configuracion(usuarioId, idiomaStr, privacidad, tema);
                }
            }
        }
        return config;
    }

}
