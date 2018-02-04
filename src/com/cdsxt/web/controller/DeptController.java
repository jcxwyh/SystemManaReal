package com.cdsxt.web.controller;

import com.cdsxt.po.Dept;
import com.cdsxt.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("dept")
public class DeptController {

    @Autowired
    private DeptService deptService;

    @RequestMapping(value={""},method = RequestMethod.GET)
    public ModelAndView find(ModelAndView modelAndView){
        modelAndView.addObject("depts",this.deptService.find());
        modelAndView.setViewName("dept/dept");
        return modelAndView;
    }

    @RequestMapping(value="add",method=RequestMethod.GET)
    public String add(){
        return "dept/deptAdd";
    }

    @RequestMapping(value="add",method = RequestMethod.POST)
    public String add(Dept dept){
        this.deptService.add(dept);
        return "redirect:/dept";
    }

    @RequestMapping(value="update/{deptno}",method = RequestMethod.GET)
    public ModelAndView update(@PathVariable("deptno") Integer deptno,ModelAndView modelAndView){
        modelAndView.addObject("dept",this.deptService.findOne(deptno));
        modelAndView.setViewName("dept/deptUpdate");
        return modelAndView;
    }

    @RequestMapping(value="update",method = RequestMethod.POST)
    public String update(Dept dept){
        this.deptService.update(dept);
        return "redirect:/dept";
    }

    @RequestMapping(value="delete/{deptno}",method = RequestMethod.GET)
    public String delete(@PathVariable("deptno") Integer deptno){
        this.deptService.delete(deptno);
        return "redirect:/dept";
    }
}
