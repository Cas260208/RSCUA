package servicios.proxyBDD;

import modulo.gestorHistorias.Historia;
import modulo.gestorHistorias.Reaccion;

public interface ipHistorias {

    public Historia cargarHistoria(int id);

    public boolean publicarHistoria(Historia historia);

    public void editarHistoria(int id, Historia historia);

    public void eliminarHistoria(int id);

    public void reaccionarHistoria(int id, Reaccion reaccion);

    public void eliminarReaccion(int id);


    /*
    Reportar, no depende del proxy, es parte del gestor o proxy Reportes
    compartir historia no depende del proxy, o de la BDD, es parte del gestorhistoria

    public void ajustarPrivacidadHistoria(int id, PrivacidadPublicaciones privacidad);

    No se hace porque la bdd no lo tiene, aunque si este en los rf :/
    y se pueda facilmente agregar a bdd     ;D
     */
}

