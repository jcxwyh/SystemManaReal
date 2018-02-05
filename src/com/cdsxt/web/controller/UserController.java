package com.cdsxt.web.controller;

import com.cdsxt.po.Role;
import com.cdsxt.po.User;
import com.cdsxt.service.RoleService;
import com.cdsxt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

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

    @RequestMapping("valiPwd")
    @ResponseBody
    public String valiPwd(@RequestParam("userId") Integer userId,@RequestParam("password") String password){
        System.out.println(111);
        User user = this.userService.findOne(userId);
        if(Objects.isNull(user)||Objects.equals(user.getPassword(),password)){
            return "false";
        }
        return "true";
    }

    @RequestMapping("changePwd")
    @ResponseBody
    public String changePwd(@RequestParam("userId") Integer userId,@RequestParam("password") String password){
        this.userService.changePwd(userId,password);
        return "true";
    }

    @RequestMapping("getRoles")
    @ResponseBody
    public List<Role> getRoles(){
        return this.roleService.find();
    }

    @RequestMapping("assign/{userId}")
    public void assign(@PathVariable("userId") Integer userId, ArrayList<Integer> roleIds){
        this.userService.assignRoles(userId,roleIds);
    }
}
