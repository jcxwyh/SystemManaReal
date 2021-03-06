package com.cdsxt.web.controller;

import com.cdsxt.po.Role;
import com.cdsxt.po.User;
import com.cdsxt.service.RoleService;
import com.cdsxt.service.UserService;
import com.cdsxt.util.Authorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

    @Authorize("SYS_USER_QUERY")
    @RequestMapping(value="",method = RequestMethod.GET)
    public ModelAndView find(ModelAndView modelAndView){
        modelAndView.addObject("users",this.userService.find());
        modelAndView.setViewName("user/user");
        return modelAndView;
    }
    @Authorize("SYS_USER_ADD")
    @RequestMapping(value="/add",method = RequestMethod.GET)
    public String add(){
        return "user/userAdd";
    }

    @Authorize("SYS_USER_ADD")
    @RequestMapping(value="/add",method=RequestMethod.POST)
    public String add(User user,Model model){
//        System.out.println(result.hasErrors());
//        if(result.hasErrors()){
//            model.addAttribute("user",user);
//            return "user/userAdd";
//        }else{
//            this.userService.add(user);
//            return "redirect:/user";
//        }
        if(user.getDept().getDeptno()==0){
            user.setDept(null);
        }
        User nameUser = this.userService.findByName(user.getUname());
        User emailUser = this.userService.findByEmail(user.getEmail());
        if(Objects.nonNull(nameUser)&&Objects.equals(nameUser.getUname(),user.getUname())){
            model.addAttribute("name","名字不能重复！");
            return "user/userAdd";
        }else if(Objects.nonNull(emailUser)&&Objects.equals(emailUser.getEmail(),user.getEmail())){
            model.addAttribute("email","邮箱地址不能重复！");
            return "user/userAdd";
        }else{
            this.userService.add(user);
            return "redirect:/user";
        }
    }

    @Authorize("SYS_USER_UPDATE")
    @RequestMapping(value="/update/{userId}",method = RequestMethod.GET)
    public String update(@PathVariable("userId") Integer userId, Model model){
        model.addAttribute("user",this.userService.findOne(userId));
        return "user/userUpdate";
    }

    @Authorize("SYS_USER_UPDATE")
    @RequestMapping(value="/update",method = RequestMethod.POST)
    public String update(User user,Model model){
        //Boolean valiRes = this.findByObj
        List<User> nameUserList = this.userService.findByNameList(user.getUname());
        List<User> emailUserList = this.userService.findByEmailList(user.getEmail());

        if(Objects.nonNull(nameUserList)&&!nameUserList.isEmpty()){
            if(nameUserList.size()>1||!Objects.equals(nameUserList.get(0).getUserId(),user.getUserId())){
                model.addAttribute("name","名字不能重复！");
                return "user/userUpdate";
            }
        }
        if(Objects.nonNull(emailUserList)&&!emailUserList.isEmpty()){
            if(emailUserList.size()>1||!Objects.equals(emailUserList.get(0).getUserId(),user.getUserId())){
                model.addAttribute("email","邮箱地址不能重复！");
                return "user/userUpdate";
            }
        }
        this.userService.update(user);
        return "redirect:/user";
    }

    @Authorize("SYS_USER_DELETE")
    @RequestMapping("/delete/{userId}")
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
    @RequestMapping("/changePwd/{userId}")
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

    @Authorize("SYS_ASSIGN_ROLE")
    @RequestMapping("/getRoles")
    @ResponseBody
    public List<Role> getRoles(){
        return this.roleService.find();
    }

    @Authorize("SYS_ASSIGN_ROLE")
    @RequestMapping("/assign")
    @ResponseBody
    public String assign(@RequestParam("userId") Integer userId, @RequestParam("roleids") Integer[] roleIds){
        //System.out.println(userId+"--"+roleIds);
        this.userService.assignRoles(userId,roleIds);
        return "true";
    }

    @RequestMapping("/forgetPwd")
    public String forgetPwd(@RequestParam("email") String email, @RequestParam("valiCode") String valiCode, @RequestParam("password") String password, HttpServletRequest request, RedirectAttributes attributes){
        Object currentCode = request.getServletContext().getAttribute("emailCode");
        Object currentEmail = request.getServletContext().getAttribute("valiEmail");
        if(Objects.isNull(email)||email.length()<1){
        	attributes.addFlashAttribute("vailMail",email);
            attributes.addFlashAttribute("message","邮箱不正确！");
            return "redirect:/system/forgetP";
        }
        
        User user = this.userService.findByEmail(email);
        
        //判断用户的真实性
        if(Objects.isNull(user)) {
        	attributes.addFlashAttribute("vailMail",email);
        	attributes.addFlashAttribute("message","用户不存在！请确认邮箱！");
            return "redirect:/system/forgetP";
        }
        
        //判断容器中是否存在email，不存在返回重新获取验证码
        if(Objects.isNull(currentEmail)||!(currentEmail instanceof String)) {
        	attributes.addFlashAttribute("message","请重新获取验证码！");
            return "redirect:/system/forgetP";
        }
        //比较获取验证码的邮箱和提交修改的邮箱一致否
        if(!Objects.equals(email, currentEmail)) {
        	attributes.addFlashAttribute("vailMail",email);
        	attributes.addFlashAttribute("message","请确认获取验证码的是此邮箱！建议重新获取！");
            return "redirect:/system/forgetP";
        }
        //查看容器内的验证码是否有效
        if(Objects.isNull(currentCode) || !(currentCode instanceof String)||((String) currentCode).length()<1){
            //request.setAttribute();
            attributes.addFlashAttribute("message","验证码已失效！请重新获取！");
            return "redirect:/system/forgetP";
        }
        //验证验证码是否匹配
        if(!Objects.equals(valiCode,currentCode)) {
        	attributes.addFlashAttribute("message","验证码错误！请重新输入！");
            return "redirect:/system/forgetP";
        }
        
        if(!Objects.equals(user.getEmail(),email)){
        	attributes.addFlashAttribute("vailMail",email);
            attributes.addFlashAttribute("message","邮箱不正确！");
            return "redirect:/system/forgetP";
        }else{
            user.setPassword(password);
            this.userService.update(user);
            attributes.addFlashAttribute("message","密码重置成功！请重新登录！");
            request.getServletContext().removeAttribute("emailCode");
            request.getServletContext().removeAttribute("valiEmail");
            return "redirect:/login";
        }
    }
}
