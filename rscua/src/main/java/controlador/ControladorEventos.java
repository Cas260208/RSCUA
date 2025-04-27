/*package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorEventos", urlPatterns = {"/ControladorEventos"})
public class ControladorEventos extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("eventos".equals(accion)) {
            request.getRequestDispatcher("vista/IU_Eventos.jsp").forward(request, response);
        } else {
            response.sendRedirect("vista/IU_Busqueda.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}
*/
package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import modulo.gestorEventos.Evento;
import modulo.gestorEventos.EventoConcreto;
import modulo.gestorEventos.EventoSingular;
import modulo.gestorEventos.EventoGrupal;
import modulo.gestorEventos.EventoMasivo;
import modulo.gestorEventos.EventoPrivado;
import modulo.gestorEventos.TipoEventoImplementador;

@WebServlet(name = "ControladorEventos", urlPatterns = {"/ControladorEventos"})
public class ControladorEventos extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("eventos".equals(accion)) {
            request.getRequestDispatcher("vista/IU_Eventos.jsp").forward(request, response);

        } else if ("crearEvento".equals(accion)) {
            // Captura de datos del formulario IU_CrearEvento.jsp
            String titulo = request.getParameter("titulo");
            String fecha = request.getParameter("fecha");
            String ubicacion = request.getParameter("ubicacion");
            String tipo = request.getParameter("tipo");
            String categoria = request.getParameter("categoria");
            String descripcion = request.getParameter("descripcion");

            // Asignar privacidad fija como "publico"
            String privacidad = "publico";

            // Aquí decides el tipo de implementación Bridge
            TipoEventoImplementador tipoEvento = null;

            switch (tipo) {
                case "Singular":
                    tipoEvento = new EventoSingular();
                    break;
                case "Grupal":
                    tipoEvento = new EventoGrupal();
                    break;
                case "Masivo":
                    tipoEvento = new EventoMasivo();
                    break;
                case "Privado":
                    tipoEvento = new EventoPrivado();
                    break;
                default:
                    tipoEvento = new EventoSingular(); // Por defecto
                    break;
            }

            // Crear el objeto EventoConcreto usando el constructor correcto
            Evento evento = new EventoConcreto(tipoEvento, titulo, fecha, ubicacion, categoria, descripcion, privacidad);

            // Registrar el evento (sin pasarle parámetros)
            evento.registrar();

            // Después de registrar, puedes redirigir al usuario
            response.sendRedirect("vista/IU_Eventos.jsp");

        } else {
            response.sendRedirect("vista/IU_Eventos.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}

