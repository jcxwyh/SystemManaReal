package com.cdsxt.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("system")
public class SystemManageController {
	
	
	@RequestMapping("")
	public String system() {
		return "welcome";
	}
}
