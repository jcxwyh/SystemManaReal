package com.cdsxt.web.controller;

import com.cdsxt.service.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("authority")
public class AuthorityController {

    @Autowired
    private AuthorityService authorityService;

    @RequestMapping(value="",method= RequestMethod.GET)
    public ModelAndView authority(ModelAndView modelAndView){
        modelAndView.addObject("authorities",this.authorityService.find());
        modelAndView.setViewName("authority/authority");
        return modelAndView;
    }
}