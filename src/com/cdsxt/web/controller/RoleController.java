package com.cdsxt.web.controller;

import com.cdsxt.po.Role;
import com.cdsxt.po.User;
import com.cdsxt.service.RoleService;
import com.cdsxt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @RequestMapping(value="",method = RequestMethod.GET)
    public ModelAndView find(ModelAndView modelAndView){
        modelAndView.addObject("roles",this.roleService.find());
        modelAndView.setViewName("role/role");
        return modelAndView;
    }

    @RequestMapping(value="add",method = RequestMethod.GET)
    public String add(){
        return "role/roleAdd";
    }

    @RequestMapping(value="add",method=RequestMethod.POST)
    public String add(Role role){
        this.roleService.add(role);
        return "redirect:/role";
    }

    @RequestMapping(value="update/{roleId}",method = RequestMethod.GET)
    public String update(@PathVariable("roleId") Integer roleId, Model model){
        model.addAttribute("role",this.roleService.findOne(roleId));
        return "role/roleUpdate";
    }

    @RequestMapping(value="update",method = RequestMethod.POST)
    public String update(Role role){
        this.roleService.update(role);
        return "redirect:/role";
    }

    @RequestMapping("delete/{roleId}")
    public String delete(@PathVariable("roleId") Integer roleId){
        this.roleService.delete(roleId);
        return "redirect:/role";
    }
}
