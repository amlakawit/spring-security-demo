package com.gmail.aamedhin.springsecuritydemo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class DemoController {
	
	@GetMapping("/")
	public String showHome(){		
		return "home";
	}
	
	@RequestMapping("/leaders")
	public String showLeaders(){
		return "leaders";
	}
	
	@RequestMapping("/systems")
	public String showSystems(){
		return "admin";
	}
	
}
