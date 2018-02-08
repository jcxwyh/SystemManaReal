package com.cdsxt.web.controller;

import com.cdsxt.po.Resource;
import com.cdsxt.po.Role;
import com.cdsxt.po.User;
import com.cdsxt.service.AuthorityService;
import com.cdsxt.service.MenuService;
import com.cdsxt.service.RoleService;
import com.cdsxt.service.UserService;
import com.cdsxt.util.Authorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

@Controller
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private MenuService menuService;

    @Authorize("SYS_ROLE_QUERY")
    @RequestMapping(value="",method = RequestMethod.GET)
    public ModelAndView find(ModelAndView modelAndView){
        modelAndView.addObject("roles",this.roleService.find());
        modelAndView.setViewName("role/role");
        return modelAndView;
    }

    @Authorize("SYS_ROLE_ADD")
    @RequestMapping(value="add",method = RequestMethod.GET)
    public String add(){
        return "role/roleAdd";
    }

    @Authorize("SYS_ROLE_ADD")
    @RequestMapping(value="add",method=RequestMethod.POST)
    public String add(Role role){
        this.roleService.add(role);
        return "redirect:/role";
    }

    @Authorize("SYS_ROLE_UPDATE")
    @RequestMapping(value="update/{roleId}",method = RequestMethod.GET)
    public String update(@PathVariable("roleId") Integer roleId, Model model){
        model.addAttribute("role",this.roleService.findOne(roleId));
        return "role/roleUpdate";
    }

    @Authorize("SYS_ROLE_UPDATE")
    @RequestMapping(value="update",method = RequestMethod.POST)
    public String update(Role role){
        this.roleService.update(role);
        return "redirect:/role";
    }

    @Authorize("SYS_ROLE_DELETE")
    @RequestMapping("delete/{roleId}")
    public String delete(@PathVariable("roleId") Integer roleId){
        this.roleService.delete(roleId);
        return "redirect:/role";
    }

    @Authorize("SYS_ASSIGN_RESOURCE")
    @RequestMapping(value="assignResource/{roleId}",method = RequestMethod.GET)
    public String assignResource(@PathVariable("roleId") Integer roleId,Model model){
        model.addAttribute("role",this.roleService.findOne(roleId));
        model.addAttribute("menus",this.menuService.find());
        return "role/assignResource";
    }

    @Authorize("SYS_ASSIGN_RESOURCE")
    @RequestMapping(value="assignResource/{roleId}",method=RequestMethod.POST)
    public String assignResource(@PathVariable("roleId") Integer roleId, @RequestParam(value="resList",defaultValue="0") Integer[] resList){
        this.roleService.assignResource(roleId,resList);
        return "redirect:/role";
    }
}
