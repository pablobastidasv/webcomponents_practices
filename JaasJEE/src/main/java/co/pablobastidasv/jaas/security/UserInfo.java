package co.pablobastidasv.jaas.security;

import lombok.Data;

import javax.enterprise.context.SessionScoped;
import javax.inject.Named;
import java.io.Serializable;

/**
 * Created by pbastidas on 4/4/15.
 */
@Named
@SessionScoped
@Data
public class UserInfo implements Serializable{

    private String username;
    private String password;

}
