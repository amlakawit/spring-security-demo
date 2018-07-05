package com.gmail.aamedhin.springsecuritydemo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

@Configuration
@EnableWebSecurity 
public class DemoSecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		//add users for in-memory authentication
		
		UserBuilder users = User.withDefaultPasswordEncoder();
		
		auth.inMemoryAuthentication()
				.withUser(users.username("ala").password("ala").roles("EMPLOYEE","MANAGER"))
				.withUser(users.username("abebe").password("abebe").roles("EMPLOYEE"))
				.withUser(users.username("sunny").password("sunny").roles("EMPLOYEE","ADMIN"));
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
