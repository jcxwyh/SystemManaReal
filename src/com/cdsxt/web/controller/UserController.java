package com.cdsxt.web.controller;

import com.cdsxt.po.User;
import com.cdsxt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping(value="",method = RequestMethod.GET)
    public ModelAndView find(ModelAndView modelAndView){
        modelAndView.addObject("users",this.userService.find());
        modelAndView.setViewName("user/user");
        return modelAndView;
    }

    @RequestMapping(value="add",method = RequestMethod.GET)
    public String add(){
        return "user/userAdd";
    }

    @RequestMapping(value="add",method=RequestMethod.POST)
    public String add(User user){
        this.userService.add(user);
        return "redirect:/user";
    }

    @RequestMapping(value="update/{userId}",method = RequestMethod.GET)
    public String update(@PathVariable("userId") Integer userId, Model model){
        model.addAttribute("user",this.userService.findOne(userId));
        return "user/userUpdate";
    }

    @RequestMapping(value="update",method = RequestMethod.POST)
    public String update(User user){
        this.userService.update(user);
        return "redirect:/user";
    }

    @RequestMapping("delete/{userId}")
    public String delete(@PathVariable("userId") Integer userId){
        this.userService.delete(userId);
        return "redirect:/user";
    }
}
