package com.gmail.aamedhin.springsecuritydemo.config;

import java.util.logging.Logger;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.mchange.v2.c3p0.ComboPooledDataSource;


@Configuration
@EnableWebSecurity 
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {
	
	
	@Autowired 
	private DataSource securityDataSource;	
	private Logger logger = Logger.getLogger(getClass().getName());
	

	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		logger.info("\n\n>>>>>JDBC Driver: " +  ((ComboPooledDataSource) securityDataSource).getDriverClass());
		logger.info(">>>>connection url: " +  ((ComboPooledDataSource) securityDataSource).getJdbcUrl());
		logger.info(">>>>>user: " +  ((ComboPooledDataSource) securityDataSource).getUser());
		logger.info(">>>>>password: " +  ((ComboPooledDataSource) securityDataSource).getPassword());
		logger.info("\n\n");
		
		auth.jdbcAuthentication().dataSource(securityDataSource); 
	
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception { /*Configure Security of web paths in application, login, logout,etc*/
		
		http.authorizeRequests() /*restrict access based on the servlet request coming in*/
					//.anyRequest().authenticated() /*any request to the app must be authenticated*/
			.antMatchers("/").hasRole("EMPLOYEE")
			.antMatchers("/leaders/**").hasRole("MANAGER")
			.antMatchers("/systems/**").hasRole("ADMIN")
			.and()
			.formLogin() /*customizing the login process*/
				.loginPage("/showDemoLoginPage") /*show the custom form "/showDemoLogin" for login*/
				.loginProcessingUrl("/authenticateUser") /*Login form should POST data to this URL for processing, no controller request mapping required*/
				.permitAll() /*allow everyone to see the login page*/
			.and()
			.logout().permitAll() /*add logout support for default URL /logout*/
			.and()
			.exceptionHandling().accessDeniedPage("/access-denied");		
	}	

}
