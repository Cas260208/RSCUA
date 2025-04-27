package modulo.gestorHistorias;

import servicios.proxyBDD.DataAccessException;
import servicios.proxyBDD.ProxyHistorias;
import servicios.proxyBDD.ipHistorias;

public class GestorHistorias implements ipHistorias{

    private final ProxyHistorias pHistorias;

    public GestorHistorias() {
        pHistorias = new ProxyHistorias();
    }

    @Override
    public Historia cargarHistoria(int id) {
        try {
            return pHistorias.cargarHistoria(id);
        } catch (DataAccessException e) {
            System.err.println("Error al cargar historia: " + e.getCause());
            return null;
        }
    }

    @Override
    public boolean publicarHistoria(Historia historia) {
        try {
            return pHistorias.publicarHistoria(historia);
        } catch (DataAccessException e) {
            System.err.println("Error al publicar historia: " + e.getCause());
            return false;
        }
    }

    @Override
    public void editarHistoria(int id, Historia historia) {
        try {
            pHistorias.editarHistoria(id, historia);
        } catch (DataAccessException e) {
            System.err.println("Error al editar historia: " + e.getCause());
        }
    }

    @Override
    public void eliminarHistoria(int id) {
        try {
            pHistorias.eliminarHistoria(id);
        } catch (DataAccessException e) {
            System.err.println("Error al eliminar historia: " + e.getCause());
        }
    }

    @Override
    public void reaccionarHistoria(int id, Reaccion reaccion) {
        try {
            pHistorias.reaccionarHistoria(id, reaccion);
        } catch (DataAccessException e) {
            System.err.println("Error al reaccionar historia: " + e.getCause());
        }
    }

    @Override
    public void eliminarReaccion(int id) {
        try {
            pHistorias.eliminarReaccion(id);
        } catch (DataAccessException e) {
            System.err.println("Error al reaccionar historia: " + e.getCause());
        }
    }
}
