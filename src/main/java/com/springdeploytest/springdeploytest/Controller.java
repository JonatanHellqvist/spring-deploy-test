package com.springdeploytest.springdeploytest;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;



@RestController
public class Controller {

	@GetMapping
	public String getIndex() {
		return "{'message': 'Hello, World!'}";
	}
	
}
