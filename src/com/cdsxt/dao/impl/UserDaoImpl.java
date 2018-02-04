package com.cdsxt.dao.impl;

import com.cdsxt.base.SessionBaseDao;
import com.cdsxt.dao.UserDao;
import com.cdsxt.po.User;
import org.springframework.stereotype.Repository;

import java.util.List;

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
}
