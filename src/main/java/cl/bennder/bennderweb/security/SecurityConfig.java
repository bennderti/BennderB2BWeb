package cl.bennder.bennderweb.security;

import cl.bennder.bennderweb.controller.LoginController;
import javax.sql.DataSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

public class SecurityConfig{}

//Pendiente de implementación (prioridad)
/*
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    

        private static final Logger log = LoggerFactory.getLogger(SecurityConfig.class);
    
	@Autowired
	DataSource dataSource;
	
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		
            log.info("inicio");
            auth.jdbcAuthentication().dataSource(dataSource)
                .usersByUsernameQuery("SELECT USUARIO AS username,password, true AS enabled FROM USUARIO WHERE USUARIO = ?")
                .authoritiesByUsernameQuery("SELECT U.USUARIO AS username, P.NOMBRE AS role  FROM USUARIO U INNER JOIN PERFIL_USUARIO PU " +
                                            "ON PU.ID_USUARIO = U.ID_USUARIO INNER JOIN PERFIL P ON PU.ID_PERFIL=P.ID_PERFIL " +
                                            "WHERE U.USUARIO = ? ");

            log.info("fin");
	}	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
            log.info("inicio");
            
            http.authorizeRequests()
                .antMatchers("/**").permitAll()
                //.antMatchers("/home.html").access("hasRole('ADMINISTRADOR')")  
                .antMatchers("/admin/**").hasRole("ADMINISTRADOR")
                .antMatchers("/empresa/**").hasRole("EMPRESA")
                .antMatchers("/proveedor/**").hasRole("PROVEEDOR")
                .and()
                    .formLogin().loginPage("/index.html").failureUrl("/index.html")
                                .usernameParameter("user").passwordParameter("password")
                .and()
                    .logout().logoutSuccessUrl("/logout.html")
                .and()
                    .exceptionHandling().accessDeniedPage("/index.html")
                .and()
                    .csrf();
            log.info("fin");
		
	}

}
*/