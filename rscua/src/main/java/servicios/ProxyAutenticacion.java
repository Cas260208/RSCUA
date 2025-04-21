package servicios;

import modulo.gestorAutenticacion.Usuario;
import modulo.gestorConfiguracion.Configuracion;

import java.sql.CallableStatement;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;


public class ProxyAutenticacion {
    private Conexion conexion;

    public ProxyAutenticacion() throws SQLException {
        this.conexion = new Conexion();
    }

    // Se elimina el metodo existeCorreoTelefonoOUsername y se reemplaza por el siguiente:
    public boolean validarUsuario(String email, String phone, String username, Date fechaNacimiento) {
        String callSP = "{CALL sp_validar_usuario(?,?,?,?)}";
        try (CallableStatement cs = conexion.getConexion().prepareCall(callSP)) {
            // Parámetro 1: correo
            cs.setString(1, email);

            // Parámetro 2: username (nullable)
            if (username != null) {
                cs.setString(2, username);
            } else {
                cs.setNull(2, Types.VARCHAR);
            }

            // Parámetro 3: phone (nullable)
            if (phone != null) {
                cs.setString(3, phone);
            } else {
                cs.setNull(3, Types.VARCHAR);
            }

            // Parámetro 4: fechaNacimiento (nullable)
            if (fechaNacimiento != null) {
                cs.setDate(4, fechaNacimiento);
            } else {
                cs.setNull(4, Types.DATE);
            }

            cs.execute();
            return true;
        } catch (SQLException ex) {
            System.err.println("Error en validación del usuario: " + ex.getMessage());
            ex.printStackTrace();
            return false;
        }
    }

    public boolean registrar(Usuario nU) throws SQLException {
        // 1) Validar usuario existente
        if (!validarUsuario(
                nU.getEmail(),
                nU.getPhone(),
                nU.getUsername(),
                nU.getFecnac())) {
            System.out.println("Validación fallida (edad menor de 18 o duplicados).");
            return false;
        }

        // 2) Llamar al SP de registro
        String callSP = "{CALL sp_registrar_usuario(?,?,?,?,?,?,?,?,?)}";
        try (CallableStatement cs = conexion.getConexion().prepareCall(callSP)) {
            // Parámetro 1: correo
            cs.setString(1, nU.getEmail());

            // Parámetro 2: teléfono (nullable)
            if (nU.getPhone() != null) {
                cs.setString(2, nU.getPhone());
            } else {
                cs.setString(2, "");
            }

            // Parámetro 3: nombre de usuario
            cs.setString(3, nU.getUsername());

            // Parámetros 4 y 5: nombre y apellido
            cs.setString(4, nU.getNombre());
            cs.setString(5, nU.getApellido());

            // Parámetro 6: contraseña
            cs.setString(6, nU.getPassword());

            // Parámetro 7: fecha de nacimiento (nullable)
            if (nU.getFecnac() != null) {
                cs.setDate(7, nU.getFecnac());
            } else {
                cs.setDate(7, new Date(System.currentTimeMillis()));
            }

            // Parámetro 8: sexo ("Femenino" o "Masculino")
            cs.setString(8, nU.getSexo().name());

            // Parámetro 9: valor extra (siempre null)
            cs.setNull(9, Types.VARCHAR);

            // 3) Ejecutar y procesar resultado
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
