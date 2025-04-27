package modulo.gestorAutenticacion;

import java.sql.Date;

public class Usuario {
    public enum Sexo {
        Femenino,
        Masculino
    }

    private int id;
    private String nombre;
    private String apellido;
    private String username;
    private String phone;
    private String email;
    private String password;
    private Date fecnac; //usa java.sql.Date
    private Sexo sexo;

    public Usuario(
            String nombre, String apellido, String username,
            String phone, String email, String password, Date fecnac, String sexo) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.sexo = Sexo.valueOf(sexo);
        this.fecnac = fecnac;
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }

    public Usuario(int id,
            String nombre, String apellido, String username,
            String phone, String email, String password, Date fecnac, String sexo) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.sexo = Sexo.valueOf(sexo);
        this.fecnac = fecnac;
        this.username = username;
        this.phone = phone;
        this.email = email;
        this.password = password;
    }

    public Usuario(String email, String password) {
        this.email = email;
        this.password = password;
    }

    // Para seguimientos (ver informacion de usuario seguido o seguidor):

    public Usuario(int id, String username) {this.id=id; this.username=username;}

    //

    public int getId() { return id; }
    public void setId(int id) {
        this.id = id;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getApellido() { return apellido; }
    public void setApellido(String apellido) { this.apellido = apellido; }
    public Date getFecnac() { return fecnac; }
    public void setFecnac(Date fecnac) { this.fecnac = fecnac; }
    public Sexo getSexo() { return sexo; }
    public void setSexo(Sexo sexo) { this.sexo = sexo; }

}
