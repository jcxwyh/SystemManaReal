package com.cdsxt.dao.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.cdsxt.base.SessionBaseDao;
import com.cdsxt.dao.DeptDao;
import com.cdsxt.po.Dept;
import com.cdsxt.po.User;

@Repository
public class DeptDaoImpl extends SessionBaseDao implements DeptDao{
    @SuppressWarnings("unchecked")
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
        Session session = this.getSession();
        Dept dept = (Dept) session.get(Dept.class,deptno);
        dept.setRoles(new HashSet<>());
        Set<User> users = dept.getUers();

        if(Objects.nonNull(users)&&!users.isEmpty())
            users.forEach(user->user.setDept(null));
        session.delete(dept);
    }

    @SuppressWarnings("unchecked")
	@Override
    public List<Dept> deptList() {
        return this.getSession().createQuery("select new Dept(d.deptno as deptno,d.dname as dname) from Dept d").list();
    }

    @Override
    public void deleteAll(Integer deptno) {
        Session session = this.getSession();
        Dept dept = (Dept) session.get(Dept.class,deptno);
        dept.setRoles(new HashSet<>());
        Set<User> users = dept.getUers();
        if(Objects.nonNull(users)&&!users.isEmpty())
            users.forEach(user->session.delete(user));
        session.delete(dept);
    }

    @Override
    public List<User> findEmps(Integer deptno) {
        return this.getSession().createCriteria(User.class).add(Restrictions.eq("dept.deptno",deptno)).list();
    }
}
