package controlador;

import modulo.gestorAutenticacion.Usuario;
import modulo.gestorNotificaciones.GNotificaciones_cliente;
import modulo.gestorPublicaciones.Comentario;
import servicios.ProxyPublicacionesCommand;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/ControladorComentario")
public class ControladorComentario extends HttpServlet {

    private ProxyPublicacionesCommand pc;

    @Override public void init() { try { pc = new ProxyPublicacionesCommand(); } catch (SQLException e) { } }

    /*  POST = crear comentario  */
    @Override protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        Usuario u = (Usuario) req.getSession().getAttribute("usuario");
        if (u == null) { resp.sendError(401); return; }

        int pubId  = Integer.parseInt(req.getParameter("pub"));
        String txt = req.getParameter("txt");

        try {
            int nuevoId = pc.crearComentario(u.getId(), pubId, txt);

            /* -------- notificar al dueño de la publicación ---------- */
            String msg = "@" + u.getUsername() + " comentó tu publicación";
            new GNotificaciones_cliente(req).procesarEvento(msg);

            /* respuesta JSON con datos mínimos para pintar al vuelo */
            resp.setContentType("application/json;charset=UTF-8");
            resp.getWriter().append("{")
                    .append("\"ok\":1,")
                    .append("\"id\":").append(String.valueOf(nuevoId)).append(',')
                    .append("\"user\":\"").append(u.getUsername()).append("\",")
                    .append("\"texto\":\"").append(txt.replace("\"","\\\"")).append("\"")
                    .append('}');
        } catch (SQLException e) {
            resp.sendError(500, e.getMessage());
        }
    }

    /*  GET = devolver lista de comentarios de una publicación  */
    @Override protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        int pubId = Integer.parseInt(req.getParameter("pub"));
        try {
            List<Comentario> lista = pc.listarPorPublicacion(pubId);

            StringBuilder out = new StringBuilder("[");
            for (int i = 0; i < lista.size(); i++) {
                Comentario c = lista.get(i);
                if (i>0) out.append(',');
                out.append('{')
                        .append("\"id\":").append(c.getId()).append(',')
                        .append("\"user\":\"").append(c.getUsuarioId()).append("\",") // o username si lo añades
                        .append("\"texto\":\"").append(c.getContenido().replace("\"","\\\"")).append('"')
                        .append('}');
            }
            out.append(']');
            resp.setContentType("application/json;charset=UTF-8");
            resp.getWriter().write(out.toString());
        } catch (SQLException e) {
            resp.sendError(500, e.getMessage());
        }
    }
}

