package com.test.spboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewsController {
	
	@GetMapping("/")
	public String home() {
		return "views/index";
	}
	
	@GetMapping("/views/**")
	public void goPage() { // /WEB-INF/views/car/car-list.jsp
	}
}
