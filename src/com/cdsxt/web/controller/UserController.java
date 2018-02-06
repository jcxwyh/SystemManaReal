package com.cdsxt.web.controller;

import com.cdsxt.po.Role;
import com.cdsxt.po.User;
import com.cdsxt.service.RoleService;
import com.cdsxt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
//        System.out.println(result.hasErrors());
//        if(result.hasErrors()){
//            model.addAttribute("user",user);
//            return "user/userAdd";
//        }else{
//            this.userService.add(user);
//            return "redirect:/user";
//        }
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

//    @RequestMapping("valiPwd")
//    @ResponseBody
//    public String valiPwd(@RequestParam("srcPwd") Integer userId,@RequestParam("password") String password){
//        System.out.println(userId+"---"+password);
//        User user = this.userService.findOne(userId);
//        if(Objects.isNull(user)||Objects.equals(user.getPassword(),password)){
//            return "false";
//        }
//        return "true";
//    }

    /**
     * 更改密码
     * 验证原密码，
     * 失败返回错误信息
     * 成功修改密码并返回空字符串
     * @param userId
     * @param password
     * @return
     */
    @RequestMapping("changePwd/{userId}")
    @ResponseBody
    public String changePwd(@PathVariable("userId") Integer userId,@RequestParam("srcPwd") String srcPwd,@RequestParam("password") String password){
        System.out.println(userId+"--"+srcPwd+"--"+password);
        User user = this.userService.findOne(userId);
        if(Objects.isNull(user)||!Objects.equals(user.getPassword(),srcPwd)){
            return "原密码不正确，请重试！";
        }
        this.userService.changePwd(userId,password);
        return "";
    }

    @RequestMapping("getRoles")
    @ResponseBody
    public List<Role> getRoles(){
        return this.roleService.find();
    }

    @RequestMapping("assign/{userId}")
    @ResponseBody
    public String assign(@PathVariable("userId") Integer userId, @RequestParam("roleIds") ArrayList<Integer> roleIds){
        System.out.println(userId+"--"+roleIds);
        this.userService.assignRoles(userId,roleIds);
        return "true";
    }

    @RequestMapping("forgetPwd")
    public String forgetPwd(@RequestParam("email") String email,@RequestParam("valiCode") String valiCode, @RequestParam("password") String password, HttpServletRequest request){
        Object currentCode = request.getServletContext().getAttribute("emailCode");
        User user = this.userService.findByEmail(email);

        if(Objects.isNull(currentCode) || !(currentCode instanceof String)||((String) currentCode).length()<1||!Objects.equals(valiCode,currentCode)){
            request.setAttribute("message","验证码错误！");
            return "forgetPwd";
        }else if(!Objects.equals(user.getEmail(),email)){
            request.setAttribute("message","邮箱不对应！");
            return "forgetPwd";
        }else{
            user.setPassword(password);
            this.userService.update(user);
            return "login";
        }
    }
}
