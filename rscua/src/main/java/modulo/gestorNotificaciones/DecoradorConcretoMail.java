package modulo.gestorNotificaciones;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

/**
 * Decorador que añade envío por correo (G-Mail SMTP TLS 587).
 * Sustituye las credenciales en WEB-INF/mail.properties
 *   mail.remitente     = tu-correo@gmail.com
 *   mail.appPassword   = xxxx xxxx xxxx xxxx
 *   mail.destinatario  = destino@ejemplo.com
 */
public class DecoradorConcretoMail extends DecoradorNotificacion {

    private final String remitente;
    private final String appPassword;
    private final String destinatario;

    public DecoradorConcretoMail(iNotificacion notificacion,
                                 String remitente,
                                 String appPassword,
                                 String destinatario) {
        super(notificacion);          // *** MUY IMPORTANTE ***
        this.remitente     = remitente;
        this.appPassword   = appPassword;
        this.destinatario  = destinatario;
    }

    @Override
    public void enviar(String mensaje) {
        super.enviar(mensaje);        // llama al decorador anterior
        enviarCorreo(mensaje);        // luego envia mail
    }

    private void enviarCorreo(String cuerpo) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session ses = Session.getInstance(props, new Authenticator() {
            @Override protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(remitente, appPassword);
            }
        });

        try {
            Message msg = new MimeMessage(ses);
            msg.setFrom(new InternetAddress(remitente));
            msg.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(destinatario, false));
            msg.setSubject("Notificación");
            msg.setText(cuerpo);
            msg.setSentDate(new Date());
            Transport.send(msg);
            System.out.println("[MAIL] Correo enviado a " + destinatario);
        } catch (MessagingException e) {
            System.err.println("[MAIL] Error enviando correo: " + e.getMessage());
        }
    }
}
