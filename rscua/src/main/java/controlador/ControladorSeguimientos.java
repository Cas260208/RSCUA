package controlador;

import modulo.gestorAutenticacion.Usuario;
import modulo.gestorSeguimientos.GestorSeguimientos;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import static java.lang.System.out;

@WebServlet("/ControladorSeguimientos")
public class ControladorSeguimientos extends HttpServlet {

    private final GestorSeguimientos gSeg = new GestorSeguimientos();

    @Override protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        /* 1) usuario en sesión */
        Usuario u = (Usuario) req.getSession().getAttribute("usuario");
        if (u == null) { resp.sendRedirect("vista/IU_InicioSesion.jsp"); return; }

        /* 2) qué lista se quiere: seguidores | siguiendo */
        String tipo = req.getParameter("tipo");           // puede ser null
        if (tipo == null) tipo = "seguidores";
        boolean listarSiguiendo = "siguiendo".equalsIgnoreCase(tipo);
        out.println("Tipo recibido = " + tipo);
        /* 3) obtener datos */
        List<Integer> ids = listarSiguiendo
                ? gSeg.cargarIdsUsuariosSeguidos(u.getId())
                : gSeg.cargarIdsUsuariosSeguidores(u.getId());

        List<String> nombres = listarSiguiendo
                ? gSeg.cargarUsernamesSeguidos(u.getId())
                : gSeg.cargarUsernamesSeguidores(u.getId());

        /* 4) ¿AJAX?  →  JSON */
        if ("1".equals(req.getParameter("ajax"))) {
            resp.setContentType("application/json;charset=UTF-8");
            StringBuilder sb = new StringBuilder("[");
            for (int i = 0; i < ids.size(); i++) {
                if (i > 0) sb.append(',');
                sb.append('{')
                        .append("\"id\":").append(ids.get(i)).append(',')
                        .append("\"user\":\"").append(nombres.get(i)).append("\",")
                        .append("\"foto\":\"vista/imagenes/perfil_")
                        .append((i % 8) + 1).append(".jpg\"}")
                ;
            }
            sb.append(']');
            resp.getWriter().write(sb.toString());
            return;
        }

        /* 5) petición normal */
        req.setAttribute("listaIds",  ids);
        req.setAttribute("listaUser", nombres);
        req.setAttribute("titulo", listarSiguiendo ? "siguiendo" : "seguidores");

        req.getRequestDispatcher("vista/IU_Seguimientos.jsp")
                .forward(req, resp);
    }

    @Override protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException { doGet(req, resp); }
}

