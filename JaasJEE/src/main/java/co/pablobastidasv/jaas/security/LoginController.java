package co.pablobastidasv.jaas.security;

import lombok.Data;

import javax.enterprise.inject.Model;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

/**
 * Controller para el proceso de login del usuario en el sistema.
 *
 * Created by pbastidas on 4/4/15.
 */
@Model
@Data
public class LoginController {

    private String username;
    private String password;

    public void login(){
        FacesContext ctx = FacesContext.getCurrentInstance();

        HttpServletRequest rq = (HttpServletRequest) ctx.getExternalContext().getRequest();

        try {
            rq.login(username, password);
        } catch (ServletException e) {
            String err = "usuario y/o clave invalida";
            ctx.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, err, err));
        }
    }

}
