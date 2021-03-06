package com.gmail.aamedhin.springsecuritydemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class LoginController {
	
	@GetMapping("/showDemoLoginPage")
	public String showDemoLoginPage(){
		return "demo-login-with-bootstrap";
	}
	
	@GetMapping("/access-denied")
	public String showAccessDenied(){
		return "access-denied";
	}
}
