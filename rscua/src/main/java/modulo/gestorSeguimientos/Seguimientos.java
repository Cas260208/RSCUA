package modulo.gestorSeguimientos;

import java.util.List;

public class Seguimientos {

    private List<Integer> idsSeguidores;
    private List<Integer> idsSeguidos;
    private List<String> usernameUsuariosSeguidores;
    private List<String> usernameUsuariosSeguidos;

    public Seguimientos() {    }

    public Seguimientos(List<Integer> idsSeguidores, List<Integer> idsSeguidos, List<String> usernameUsuariosSeguidores, List<String> usernameUsuariosSeguidos) {
        this.idsSeguidores = idsSeguidores;
        this.idsSeguidos = idsSeguidos;
        this.usernameUsuariosSeguidores = usernameUsuariosSeguidores;
        this.usernameUsuariosSeguidos = usernameUsuariosSeguidos;
    }

    public List<Integer> getIdsSeguidores() {
        return idsSeguidores;
    }

    public void setIdsSeguidores(List<Integer> idsSeguidores) {
        this.idsSeguidores = idsSeguidores;
    }

    public List<Integer> getIdsSeguidos() {
        return idsSeguidos;
    }

    public void setIdsSeguidos(List<Integer> idsSeguidos) {
        this.idsSeguidos = idsSeguidos;
    }

    public List<String> getUsernameUsuariosSeguidores() {
        return usernameUsuariosSeguidores;
    }

    public void setUsernameUsuariosSeguidores(List<String> usernameUsuariosSeguidores) {
        this.usernameUsuariosSeguidores = usernameUsuariosSeguidores;
    }

    public List<String> getUsernameUsuariosSeguidos() {
        return usernameUsuariosSeguidos;
    }

    public void setUsernameUsuariosSeguidos(List<String> usernameUsuariosSeguidos) {
        this.usernameUsuariosSeguidos = usernameUsuariosSeguidos;
    }
}
