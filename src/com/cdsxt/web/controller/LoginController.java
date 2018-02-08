package com.cdsxt.web.controller;

import com.cdsxt.service.LoginService;
import com.cdsxt.vo.LoginUser;
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
	
	@RequestMapping(value={"/","/login"},method=RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("login");
	}
	
	@RequestMapping(value="login",method=RequestMethod.POST)
	public String login(User user, HttpServletRequest request) {
		User currentUser = this.loginService.findByName(user.getUname());
		//用于初始化roles
		//currentUser.getRoles();
		if(Objects.isNull(currentUser)){
			request.setAttribute("message","请核对用户名后再播！");
			return "login";
		}

		if(currentUser.getEnabled()==0){
			request.setAttribute("message","此账号不可用，请联系管理员！");
			return "login";
		}
		if(currentUser.getLocked()==0){
			request.setAttribute("message","此账号已锁定，请联系管理员！");
			return "login";
		}


		if(Objects.equals(currentUser.getPassword(),user.getPassword())){
			LoginUser loginUser = this.loginService.findAllInfo(currentUser.getUserId());
			request.getSession().setAttribute("loginUser",loginUser);
			request.getServletContext().removeAttribute("emailCode");
			request.getServletContext().removeAttribute("valiEmail");
			return "redirect:/system";
		}
		request.setAttribute("message","账户名或密码错误！");
		return "login";
	}

	@RequestMapping(value="logout",method = RequestMethod.GET	)
	public ModelAndView logout(ModelAndView modelAndView,HttpServletRequest request){
		request.getSession().removeAttribute("loginUser");
		modelAndView.addObject("message","已安全退出！");
		modelAndView.setViewName("login");
		return modelAndView;
	}



}
