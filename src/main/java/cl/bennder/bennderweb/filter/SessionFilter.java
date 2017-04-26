/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.bennder.bennderweb.filter;

//import cl.bennder.bennderweb.controller.HomeController;
import cl.bennder.bennderweb.session.UsuarioSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 *
 * @author dyanez
 */
@Service
public class SessionFilter extends OncePerRequestFilter {

    @Autowired
    private UsuarioSession usuarioSession;
    
    private final Logger log = LoggerFactory.getLogger(SessionFilter.class);
    
    
    @Override
    protected void doFilterInternal(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws ServletException, IOException {

        String path = req.getContextPath() + "/index.html";
        List<String> urlIgnoradas = new ArrayList<>();
        String urlPatter = req.getServletPath();
        urlIgnoradas.add("/index.html");
        urlIgnoradas.add("/login.html");
        urlIgnoradas.add("/requestPassword.html");
        
        
        
        
        HttpSession session = req.getSession();	
        UsuarioSession u = this.usuarioSession;
        if (urlIgnoradas.contains(urlPatter)) {
            chain.doFilter(req, res);
        } else {
            try {
                if (session != null && session.getAttribute("user") != null) {
                    chain.doFilter(req, res);
                } else {
                    
                    log.info("Usuario sin session activa, será dirigido a login (causado en url->{})",urlPatter);
                    //System.out.println("Usuario sin session activa, será dirigido a login (causado en url->"+urlPatter+")");
                    //res.sendError(res.SC_BAD_REQUEST, "important_parameter needed");
                    res.sendRedirect(path);
                }
            } catch (IOException | ServletException e) {
                e.printStackTrace();
                res.sendRedirect(path);
            }
        }

    }

}
