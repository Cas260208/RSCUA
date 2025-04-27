package servicios.proxyBDD;

public class DataAccessException extends RuntimeException {
    public DataAccessException(Throwable cause) {
        super(cause);
    }

    public DataAccessException(String errorAlInicializarProxySeguimientos, Exception e) {
        super(errorAlInicializarProxySeguimientos, e);
    }
}
