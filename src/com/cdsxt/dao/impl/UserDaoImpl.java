package com.cdsxt.dao.impl;

import com.cdsxt.base.SessionBaseDao;
import com.cdsxt.dao.UserDao;
import com.cdsxt.po.Role;
import com.cdsxt.po.User;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Repository
public class UserDaoImpl extends SessionBaseDao implements UserDao{
    @Override
    public List<User> find() {
        return this.getSession().createQuery("from User u").list();
    }

    @Override
    public void add(User user) {
        this.getSession().save(user);
    }

    @Override
    public User findOne(Integer userId) {
        return (User) this.getSession().get(User.class,userId);
    }

    @Override
    public void delete(Integer userId) {
        User user = new User();
        user.setUserId(userId);
        this.getSession().delete(user);
    }

    @Override
    public void update(User user) {
        this.getSession().update(user);
    }

    @Override
    public void changePwd(Integer userId, String password) {
        User user = (User) this.getSession().get(User.class,userId);
        user.setPassword(password);
    }

    @Override
    public void assignRoles(Integer userId, ArrayList<Integer> roleIds) {
        Session session = this.getSession();
        User user = (User) session.get(User.class,userId);
        user.setRoles(new HashSet<>());
        Set<Role> roles = user.getRoles();
        for(Integer id:roleIds){
            Role role = new Role();
            role.setRoleId(id);
            roles.add(role);
        }
    }
}
