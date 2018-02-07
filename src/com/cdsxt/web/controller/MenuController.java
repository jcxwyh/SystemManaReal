package com.cdsxt.web.controller;

import com.cdsxt.po.Resource;
import com.cdsxt.po.User;
import com.cdsxt.service.MenuService;
import com.cdsxt.service.UserService;
import com.cdsxt.util.Authorize;
import com.cdsxt.vo.MenuZTree;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
@RequestMapping("menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @Authorize("SYS_MENU_QUERY")
    @RequestMapping(value="",method = RequestMethod.GET)
    public ModelAndView find(ModelAndView modelAndView){
        modelAndView.addObject("menus",this.menuService.find());
        modelAndView.setViewName("menu/menu");
        return modelAndView;
    }

//    @RequestMapping("getMenus")
//    @ResponseBody
//    public List<Resource> getMenus(){
//        //组合为zTree格式数据返回
////        List<Resource> resources = this.menuService.find();
////        List<MenuZTree> menuZTrees = new ArrayList<>();
////        for(Resource resource:resources){
////            MenuZTree menuZTree = new MenuZTree();
////            menuZTree.setPid(resource.getResId());
////            menuZTree.setId(Objects.isNull(resource.getResource())?0:resource.getResource().getResId());
////            //menuZTree.setName(Objects.isNull(resource.getResource())?null:resource.getResource().getRname());
////            menuZTree.setName(resource.getRname());
////
////            menuZTrees.add(menuZTree);
////        }
////        return menuZTrees;
//        return this.menuService.find();
//    }

}
