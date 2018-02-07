package com.cdsxt.web.controller;

import com.cdsxt.po.Resource;
import com.cdsxt.service.AuthorityService;
import com.cdsxt.util.Authorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("authority")
public class AuthorityController {

    @Autowired
    private AuthorityService authorityService;

    @Authorize("SYS_MENU_QUERY")
    @RequestMapping(value="",method= RequestMethod.GET)
    public ModelAndView authority(ModelAndView modelAndView){
        modelAndView.addObject("authorities",this.authorityService.find());
        modelAndView.setViewName("authority/authority");
        return modelAndView;
    }

//    @RequestMapping("getAuths")
//    @ResponseBody
//    public List<Resource> getAuths(){
//        return this.authorityService.find();
//    }
}
