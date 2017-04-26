/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 * http://www.decodigo.com/2013/04/mejores-practicas.html
 * http://www.javamexico.org/blogs/043h68/cosas_del_core_de_java_que_debes_saber
 */
package cl.bennder.bennderweb.model;

import java.io.Serializable;

/**
 *
 * @author dyanez
 * Hacemos que la clase sea serializable e inmutable mejora la perfomance sin crear tantos
 */
public class LoginForm implements Serializable{
    private String user;
    private String password;

    public LoginForm() {
    }
    
    public LoginForm(String user, String password) {
        this.user = user;
        this.password = password;
    }
    

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "LoginForm{" + "user=" + user + '}';
    }
    
}
