package com.gmail.aamedhin.springsecuritydemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller 
public class LoginController {
	
	@GetMapping("/showDemoLoginPage")
	public String showDemoLoginPage(){
		return "demo-login-with-bootstrap";
	}
}
