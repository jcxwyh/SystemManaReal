package com.cdsxt.web.controller;

import com.cdsxt.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cdsxt.po.User;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	
	@RequestMapping(value={"","login"},method=RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("login");
	}
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(User user, HttpServletRequest request) {
		User currentUser = this.loginService.findByName(user.getUname());
		if(Objects.nonNull(currentUser) && Objects.equals(currentUser.getPassword(),user.getPassword())){
			request.getSession().setAttribute("loginUser",user);
			return "redirect:/system";
		}
		request.setAttribute("message","账户名或密码错误！");
		return "login";
	}



}
