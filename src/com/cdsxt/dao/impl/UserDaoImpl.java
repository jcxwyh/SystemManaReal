package com.cdsxt.dao.impl;

import com.cdsxt.base.SessionBaseDao;
import com.cdsxt.dao.UserDao;
import com.cdsxt.po.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDaoImpl extends SessionBaseDao implements UserDao {
    @Override
    public List<User> find() {
        return this.getSession().createQuery("from User u").list();
    }
}
