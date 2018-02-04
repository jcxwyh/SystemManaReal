package com.cdsxt.dao.impl;

import com.cdsxt.base.SessionBaseDao;
import com.cdsxt.dao.DeptDao;
import com.cdsxt.po.Dept;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class DeptDaoImpl extends SessionBaseDao implements DeptDao{
    @Override
    public List<Dept> find() {
        return this.getSession().createCriteria(Dept.class).list();
    }

    @Override
    public void add(Dept dept) {
        this.getSession().save(dept);
    }

    @Override
    public Dept findOne(Integer deptno) {
        return Dept.class.cast(this.getSession().get(Dept.class,deptno));
    }

    @Override
    public void update(Dept dept) {
        this.getSession().update(dept);
    }

    @Override
    public void delete(Integer deptno) {
        Dept dept = new Dept();
        dept.setDeptno(deptno);
        this.getSession().delete(dept);
    }
}
