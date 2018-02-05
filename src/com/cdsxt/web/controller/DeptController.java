package com.cdsxt.web.controller;

import com.cdsxt.po.Dept;
import com.cdsxt.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

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

    @RequestMapping("deptList")
    @ResponseBody
    public List<Dept> deptList(){
        return this.deptService.deptList();
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

    @RequestMapping(value="delete/{deptno}/{mode}",method = RequestMethod.GET)
    public String delete(@PathVariable("deptno") Integer deptno,@PathVariable("mode") Integer mode){
        this.deptService.delete(deptno,mode);
        return "redirect:/dept";
    }

    @RequestMapping("valiUser")
    @ResponseBody
    public Boolean valiUser(@RequestParam("deptno") Integer deptno){
        Dept dept = this.deptService.findOne(deptno);
        return dept.getUers()==null?false:dept.getUers().isEmpty()?false:true;
    }
}
