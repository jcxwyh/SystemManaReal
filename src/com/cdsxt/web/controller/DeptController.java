package com.cdsxt.web.controller;

import com.cdsxt.po.Dept;
import com.cdsxt.po.User;
import com.cdsxt.service.DeptService;
import com.cdsxt.util.Authorize;
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

    @Authorize("SYS_DEPT_QUERY")
    @RequestMapping(value={""},method = RequestMethod.GET)
    public ModelAndView find(ModelAndView modelAndView){
        modelAndView.addObject("depts",this.deptService.find());
        modelAndView.setViewName("dept/dept");
        return modelAndView;
    }

    @Authorize("SYS_DEPT_QUERY")
    @RequestMapping("deptList")
    @ResponseBody
    public List<Dept> deptList(){
        return this.deptService.deptList();
    }

    @Authorize("SYS_DEPT_ADD")
    @RequestMapping(value="add",method=RequestMethod.GET)
    public String add(){
        return "dept/deptAdd";
    }

    @Authorize("SYS_DEPT_ADD")
    @RequestMapping(value="add",method = RequestMethod.POST)
    public String add(Dept dept){
        this.deptService.add(dept);
        return "redirect:/dept";
    }

    @Authorize("SYS_DEPT_UPDATE")
    @RequestMapping(value="update/{deptno}",method = RequestMethod.GET)
    public ModelAndView update(@PathVariable("deptno") Integer deptno,ModelAndView modelAndView){
        modelAndView.addObject("dept",this.deptService.findOne(deptno));
        modelAndView.setViewName("dept/deptUpdate");
        return modelAndView;
    }

    @Authorize("SYS_DEPT_UPDATE")
    @RequestMapping(value="update",method = RequestMethod.POST)
    public String update(Dept dept){
        this.deptService.update(dept);
        return "redirect:/dept";
    }

    @Authorize("SYS_DEPT_DELETE")
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
    
    /**
     *	显示部门中员工信息 
     * @param deptno
     * @param
     * @return
     */
    @Authorize("SYS_USER_QUERY")
    @RequestMapping("showEmp/{deptno}")
    @ResponseBody
    public List<User> showEmp(@PathVariable("deptno") Integer deptno) {
    	return this.deptService.findEmps(deptno);
    }
}
